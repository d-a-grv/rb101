def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i > 0
end

def valid_operation?(op)
  %w(1 2 3 4).include?(op)
end

def operation_message(op_mess)
  case op_mess
  when '1'
    'Adding'
  when '2'
    'Substracting'
  when '3'
    'Dividing'
  when '4'
    'Multiplying'
  end
end

prompt("Welcome! Let's calculate some stuff! Enter your name:")

name = ""

loop do
  name = gets.chomp

  break unless name.empty?

  prompt("Please, enter a valid name:")
end

loop do
  number1 = ''
  number2 = ''

  prompt("#{name}, enter first number:")

  loop do
    number1 = gets.chomp
    break if valid_number?(number1)
    prompt("Please, enter a valid number:")
  end

  prompt("Now, enter second number:")

  loop do
    number2 = gets.chomp

    break if valid_number?(number2)
    prompt("Please, enter a valid number:")
  end

  operator_prompt = <<-MSG
  What would you like to do with these numbers?
  1) add
  2) substract
  3) divide
  4) multiply
  MSG

  prompt(operator_prompt)

  operation = ''

  loop do
    operation = gets.chomp

    break if valid_operation?(operation)
    prompt("Please, choose 1, 2, 3 or 4:")
  end

  result =  case operation.downcase
            when "1"
              number1.to_i + number2.to_i
            when "2"
              number1.to_i - number2.to_i
            when "3"
              number1.to_f / number2.to_f
            when "4"
              number1.to_i * number2.to_i
            end

  prompt("#{operation_message(operation)}...")

  prompt("The result of the culculation is #{result}")

  prompt("Would you like to do another calculation? (Y to do it again)")

  repeat = gets.chomp

  break unless repeat.downcase.start_with?('y')
end
