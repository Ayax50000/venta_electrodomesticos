require_relative 'Data.rb'

class Product

  def initialize(name,price = 0)
    puts @name = name.upcase
    puts @price = price.to_f
  end

  def registered?
    answer = false
    $products.each do |product|
      answer = true if product[0] == @name
    end
    answer
  end

  def register(stock = 0)
    stock.to_i
    if !(registered?)
      $products << [@name,@price,stock]
      $success.call
    else
      $failure.call
    end
  end

  def all(param = "")
    param.upcase
    list = $products[0]
    $products.each do |product|
      if product[0].include? param
        list << product
      end
    end
    list
  end

end

product = Product.new("freezer",500)
puts product.register
