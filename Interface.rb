require_relative 'User.rb'
require_relative 'Product.rb'
require_relative 'Statistics.rb'

def start
  puts "start session"
  puts "what's your User name ?\n"
  name = gets.chomp
  puts "What's your pasword? \n"
  pass = gets.chomp
  user = User.new(name,pass)
  if user.session_open

  end
end

def menu
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
