def multiply(num1, num2)
  num1 * num2
end

def power_to_n(num, power)
  return 1 if power.zero?

  result = num
  (power - 1).times { result = multiply(result, num) }

  result
end

p power_to_n(2, 1)
