puts "Welcome! Let's calculate some stuff! Enter two integers:"

input_number1 = gets.chomp
input_number2 = gets.chomp

number1 = input_number1.to_i
number2 = input_number2.to_i

puts "What would you like to do with these numbers (add, substract, divide or multiply?"

operation = gets.chomp

case operation.downcase
when "add"
  result = number1 + number2
when "substract"
  result = number1 - number2
when "divide"
  result = number1.to_f / number2.to_f
when "multiply"
  result = number1 * number2
end

puts "The result of the culculation is #{result}"