(1..99).each do |number|
  puts number if number.odd?
end

1.upto(99).select do |number|
  next if number.even?

  puts number
end
