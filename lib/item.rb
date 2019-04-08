class Item < Base
  attr_reader :product, :amount

  def initialize(product, amount)
    @product = product
    @amount = amount
  end
end
