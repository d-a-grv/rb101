puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip_percent = gets.to_f

tip = (tip_percent * bill / 100).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{sprintf("%.2f", tip)}"
puts "The total is $#{sprintf("%.2f", total)}"
