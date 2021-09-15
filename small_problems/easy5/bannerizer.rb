def print_in_box(text)
  extra_dashes = "-" * text.length
  extra_space = " " * text.length
  puts "+-#{extra_dashes}-+"
  puts "| #{extra_space} |"
  puts "| #{text} |"
  puts "| #{extra_space} |"
  puts "+-#{extra_dashes}-+"

end



print_in_box('To boldly go where no one has gone before.')
print_in_box(' ')