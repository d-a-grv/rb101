def multisum(int)
  (3..int).to_a.select { |num| (num % 3).zero? || (num % 5).zero? }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234_168
