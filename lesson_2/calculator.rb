require 'yaml'

MESSAGES = { eng: YAML.load_file('calculator_messages.yml'),
             ru: YAML.load_file('calculator_messages_ru.yml')
}

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

def valid_operation?(op)
  %w(1 2 3 4).include?(op)
end

def operation_message(op_mess, lang)
  message = if lang == :eng
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
            elsif lang == :ru
              case op_mess
              when '1'
                'Складываю'
              when '2'
                'Отнимаю'
              when '3'
                'Делю'
              when '4'
                'Умножаю'
              end
            end
end

prompt("Choose language: ENG or RU")

language = gets.chomp

if language.downcase.start_with?('ru')
  language = :ru
else
  language = :eng
end

prompt(MESSAGES[language]['welcome'])

name = ""

loop do
  name = gets.chomp

  break unless name.empty?

  prompt(MESSAGES[language]['valid_name'])
end

loop do
  number1 = ''
  number2 = ''

  prompt(name + MESSAGES[language]['first_number'])

  loop do
    number1 = gets.chomp
    break if valid_number?(number1)
    prompt(MESSAGES[language]['valid_number'])
  end

  prompt(MESSAGES[language]['second_number'])

  loop do
    number2 = gets.chomp

    break if valid_number?(number2)
    prompt(MESSAGES[language]['valid_number'])
  end

  prompt(MESSAGES[language]['choice'])

  operation = ''

  loop do
    operation = gets.chomp

    break if valid_operation?(operation)
    prompt(MESSAGES[language]['valid_choice'])
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

  prompt("#{operation_message(operation, language)}...")
  
  prompt(MESSAGES[language]['result'] + "#{result}")

  prompt(MESSAGES[language]['repeat'])

  repeat = gets.chomp

  break unless repeat.downcase.start_with?('y') || repeat.downcase.start_with?('д')
end