# frozen_string_literal: true

require 'date'

puts 'What is your age?'
age = gets.to_i

puts 'At what age would you like to retire?'
retirement_age = gets.to_i

years_left = retirement_age - age
current_year = Date.today.year
retirement_year = current_year + years_left

puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You have only #{years_left} years of work to go!"
