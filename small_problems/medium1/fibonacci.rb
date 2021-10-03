def fibonacci(n)
  if n < 3
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

def fibonacci(n)
  first = 0
  second = 1
  new_num = first + second

  (n-2).times do 
    first = second
    second = new_num
    new_num = first + second
  end

  new_num
end

def fibonacci_last(num)
  fibonacci(num).digits.reverse.last
end

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % (last_2.last.to_s.length * 10)]
  end

  last_2.last.to_s[-1].to_i
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4