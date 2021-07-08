def stringy(int)
  arr = %w(1 0)
  result = ''

  loop do
    arr.each do |num|
      result << num
      break if result.size == int
    end
    break if result.size == int
  end
  result
end

p stringy(6)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

#option 2
def stringy(size, starting_integer=1)
  numbers = []
  integers = [1, 0]
  integers.reverse! if starting_integer == 0

  size.times do |index|
    number = index.even? ? integers[0] : integers[1]
    numbers << number
  end

  numbers.join
end
