class Basket
  attr_accessor :products

  def initialize
    @products = []
  end

  def <<(product)
    @products << product
  end

  def total_price
    @products.sum(&:price)
  end

  def to_s
    @products
      .tally
      .map { |product, amount| "#{product} #{amount} x #{amount * product.price} шт." }
      .join("\n")
  end
end
