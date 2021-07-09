def display_message(name)
  name = 'Teddy' if name == ''
  puts "#{name} is #{age} years old"
end

def age(range=(20..200))
  rand(range)
end

puts "What's your name?"
name = gets.chomp
display_message(name)
