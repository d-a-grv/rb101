STARTING_INTEGER = 1

def sum(integer)
  (STARTING_INTEGER..integer).sum
end

def product(integer)
  (STARTING_INTEGER..integer).reduce(:*)
end

puts 'Please enter an integer greater than 0:'
user_integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product:"
operation = gets.chomp

result = 0

case operation
when 's'
  result = sum(user_integer)
  operation = 'sum'
when 'p'
  result = product(user_integer)
  operation = 'product'
else
  operation = nil
  err_msg = 'Invalid operation choice.'
end

result_msg = "The #{operation} of the integers between #{STARTING_INTEGER} and #{user_integer} is #{result}."

puts operation.nil? ? err_msg : result_msg
