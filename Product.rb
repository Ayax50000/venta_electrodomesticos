require_relative 'Data.rb'

class Product

  @@current_ids = [7]
  @@sells = []

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
    $products.each do |product|
      if (product[1][0].include? param) && product[1][0]!="NAME"
        Product.show(product)
      end
    end
  end

  def self.add_sell(id_product,amount)
    name = get_by_id(id_product)
    cost = value(id_product,amount)
    @@sells << [name,amount,cost[0],cost[1],id_product]
  end

  def self.value(id,amount)
    if get_by_id(id) != "nothing"
    val = [$products[id][1] * amount,$products[id][1]]
    end
    val ||= [0,0]
  end

  def self.sell
    system 'clear'
    puts "NAME\tAMOUNT\tPRICE\tTOTAL"
    total = 0
    @@sells.each do |product|
      puts "#{product[0]}\t#{product[1]}\t#{product[3]}\t#{product[2]}"
      total += product[2]
    end
    puts "total = #{total}"
  end

  def self.get_by_id(id)
    name = $products[id][0]
    name ||= "nothing"
  end

  def delete_product()

  end

end

command = "n"
while command != "s"
  if command == "n"
    system 'clear'
    Product.all
    puts "what is the id product do you like to sell?\n"
    id = gets.chomp
    puts "how much products?"
    amount = gets.chomp
    Product.add_sell(id.to_i,amount.to_f)
  end
  print "press s to finish the sell or n to add other product\n"
  command = gets.chomp
end
Product.sell
