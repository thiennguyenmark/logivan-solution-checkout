class Checkout < Base
  attr_reader :items, :is_discount_on_total_price

  def initialize(promotional_rules = [])
    @total = 0
    @is_discount_on_total_price = false
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @promotional_rules.each do |promotional_rule|
      next unless promotional_rule.discount_on_total_item?

      if promotional_rule.available_on_item?(item)
        @total -= item.product.price * item.amount
        @total += promotional_rule.discount * item.amount
      end
    end
  end

  def total
    return round_total_price if @is_discount_on_total_price
    return round_total_price unless (pr = discount_total_promotional_rule)
    return round_total_price if @total < pr.min_total_price
    @total -= @total * pr.discount
    @is_discount_on_total_price = true
    round_total_price
  end

  def items=(items = [])
    @items = items
    @is_discount_on_total_price = false
    @total = total_price_without_promational_rules
  end

  private

  def total_price_without_promational_rules
    @total_price = 0
    items.each do |item|
      @total_price += item.product.price * item.amount
    end
    @total_price
  end

  def discount_total_promotional_rule
    @dtpr = @promotional_rules.find do |pr|
      pr.discount_on_total_price?
    end
  end

  def round_total_price
    @total.round(2)
  end
end
