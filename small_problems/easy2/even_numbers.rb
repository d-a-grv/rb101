(1..99).each do |number|
  puts number if number.even?
end

1.upto(99).select do |number|
  next if number.odd?

  puts number
end
