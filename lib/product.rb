class Product < Base
  attr_reader :name, :product_code, :price

  def initialize(product_code, name, price)
    super()
    @product_code = product_code
    @name = name
    @price = price
  end
end
