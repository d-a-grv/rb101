numbers = []

puts 'Enter the 1st number:'
numbers << gets.chomp.to_i

puts 'Enter the 2nd number:'
numbers << gets.chomp.to_i

puts 'Enter the 3d number:'
numbers << gets.chomp.to_i

puts 'Enter the 4th number:'
numbers << gets.chomp.to_i

puts 'Enter the 5th number:'
numbers << gets.chomp.to_i

puts 'Enter the last number:'
last_num = gets.chomp.to_i

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}"
else
  puts "The number #{last_num} does not appear in #{numbers}"
end
