puts 'Please write word or multiple words:'
input_str = gets.chomp

num_of_chars = input_str.split.join.length

puts "There are #{num_of_chars} in \"#{input_str}\"."
