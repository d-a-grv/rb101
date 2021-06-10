require 'pry'

def prompt(message)
  puts '=> ' + message
end

def name_invalid?(name)
  name.empty? || name == ' '
end

def get_valid_number
  loop do
    number = gets.chomp

    return number if number.to_i.to_s == number
    return number if number.to_f.to_s == number
    prompt('Please, enter a valid number:')
  end
end

prompt('Welcome to the Loan Calculator!')
prompt('What is your name?')
name = ''

loop do
  name = gets.chomp

  break unless name_invalid?(name)
  prompt('Please, enter a valid name:')
  p name
end

loop do
  prompt("Ok. #{name}, what's the loan amount?")
  loan_amount = get_valid_number

  prompt("What's the annual percentage rate (APR) on your loan?")
  annual_rate = get_valid_number
  monthly_rate = annual_rate.to_f / 1200

  prompt("How long is your loan set for (years and months)?\n Years:")
  loan_duration_years = get_valid_number

  prompt('Months')
  loan_duration_months = get_valid_number
  loan_duration = loan_duration_years.to_f * 12 + loan_duration_months.to_f

  monthly_payment = (loan_amount.to_f *
                    (monthly_rate / 
                    (1 - (1 + monthly_rate)**(-loan_duration.to_f)))).round(2)

  prompt("Calculating your monthly payments...")
  prompt("You will pay $#{monthly_payment} a month for #{loan_duration.to_i} months")

  prompt('Do you have another loan to calculate? (Y to repeat)')
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end
