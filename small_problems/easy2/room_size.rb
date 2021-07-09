# frozen_string_literal: true

FOOT_IN_INCHES = 12

INCH_IN_CM = 2.54

def to_inch(measure)
  measure * FOOT_IN_INCHES
end

def to_cm(measure)
  measure * INCH_IN_CM
end

puts 'Enter the length of the room in feet:'
length = gets.chomp.to_f

puts 'Enter the width of the room in feet:'
width = gets.chomp.to_f

square = length * width
puts "The area of the room is #{square} feet (#{to_inch(square)} square inches or #{to_cm(square)} square centimeters)."
