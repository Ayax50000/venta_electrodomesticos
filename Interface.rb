require_relative 'User.rb'
require_relative 'Product.rb'

def clean
  system 'clear'
end

def start
  clean
  puts "start session"
  puts "what's your User name ?\n"
  name = gets.chomp
  puts "What's your pasword? \n"
  pass = gets.chomp
  user = User.new(name,pass)
  if user.session_open
    clean
    menu
    control
  end
end

def menu
   puts "#{$current_user[0]} welcome\n\n\n"
   puts "What do you like to do
          1) sell products
          2) return product
          3) modify price
          4) register product
          5) unregister product
          6) input product
          7) sales overview
          8) close session "
end

def control
  input = nil
  while input != 8
    input = gets.to_i
    case input
      when 1 then go_back {sell_product}
      when 2 then go_back do
          Product.all(false)
          puts "what is the product id ?"
          id = gets.to_i
          puts "how much do you want?"
          amount = gets.to_i
          Product.add_products(id,amount)
        end
      when 3 then go_back do
          Product.all(false)
          puts "what is the product id?"
          id = gets.to_i
          puts "Which is the new price?"
          price = gets.to_f
          Product.modifi_price(id,price)
        end
      when 4 then go_back do
          puts "what's the name"
          product = Product.new(gets)
          product.register
        end
      when 5 then go_back do
          Product.all(false)
          puts "What is the product id"
          Product.delete(gets.to_i)
        end
      when 6 then
      when 7 then
      when 8 then
    end
  end
end

def sell_product
command = "n"
  while command != "s"
    if command == "n"
      system 'clear'
      Product.all(false)
      puts "what is the product id do you like to sell?\n"
      id = gets.chomp
      puts "how much products?"
      amount = gets.chomp
      Product.add_sell(id.to_i,amount.to_f)
    end
    print "press s to finish the sell or n to add other product\n"
    command = gets.chomp
  end
  Product.sell
end

def go_back
  clean
  print "\n"*10
  yield
  print "\n"*10
  puts "Press enter to return into the main menu"
  gets
  clean
  menu
  control
end
start
