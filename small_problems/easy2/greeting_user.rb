def yelling_user?(name)
  name.end_with?('!')
end

def yell_back(name)
  "HELLO #{name.delete('!').upcase}. WHY ARE WE SCREAMING?"
end

def greeting(name)
  return yell_back(name) if yelling_user?(name)

  "Hello #{name.capitalize}."
end

puts 'What is your name?'
name = gets.chomp

puts greeting(name)
