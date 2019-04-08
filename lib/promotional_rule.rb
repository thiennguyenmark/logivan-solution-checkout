class PromotionalRule < Base
  attr_reader :products, :discount, :min_order, :min_total_price

  def initialize(
    rule_type: nil,
    discount: 0,
    products: [],
    min_order: 0,
    min_total_price: 0
  )
    @rule_type = rule_type
    @discount = discount
    @products = products
    @min_order = min_order
    @min_total_price = min_total_price
  end

  def available_on_item?(item)
    products.include?(item.product) && min_order <= item.amount
  end

  def discount_on_total_price?
    @rule_type == :discount_on_total_price
  end

  def discount_on_total_item?
    @rule_type == :discount_on_total_item
  end
end
