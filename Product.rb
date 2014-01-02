require_relative 'Data.rb'

class Product

  @@current_ids = [7]

  def initialize(name,price = 0)
    puts @name = name.upcase
    puts @price = price.to_f
  end

  def registered?
    answer = false
    $products.each do |product|
      answer = true if product[1][0] == @name
    end
    answer
  end

  def self.new_id
    id = 0
    if @@current_ids.size > 1
      id = @@current_ids.last
      @@current_ids.pop
    else
      id = @@current_ids[0]
      @@current_ids[0] += 1
    end
    id
  end

  def register(stock = 0)
    if !(registered?)
      $products[Product.new_id] = [@name,@price,stock.to_i]
      $success.call
    else
      $failure.call
    end
  end

  def self.show(array)
   puts "#{array[0]} #{array[1]} #{array[2]}"
  end

  def self.all(param = "")
    param.upcase!
    Product.show($products[:index])
    $products.each do |product|
      if (product[1][0].include? param) && product[1][0]!="NAME"
        Product.show(product)
      end
    end
  end

  def prepare_sell()

  end
end

product = Product.new("freezer",500)
 Product.all
product.register
Product.all
