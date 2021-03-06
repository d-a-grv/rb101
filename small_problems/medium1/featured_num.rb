def valid?(num)
  num.digits.reverse.uniq.join.to_i == num
end

def featured(num)
  num += 1
  num += 1 until num % 7 == 0 && num.odd?

  loop do
    return num if valid?(num)
    num += 14
    break if num >= 9_876_543_210
  end
  
  'There is no possible number that fulfill those requirements'
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements