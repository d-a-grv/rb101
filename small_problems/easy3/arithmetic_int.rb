def prompt(str)
  puts "==> #{str}"
end

def show_math(num1, num2)
  prompt("#{num1} + #{num2} = #{num1+num2}")
  prompt("#{num1} - #{num2} = #{num1-num2}")
  prompt("#{num1} / #{num2} = #{num1/num2}")
  prompt("#{num1} * #{num2} = #{num1*num2}")
  prompt("#{num1} % #{num2} = #{num1%num2}")
  prompt("#{num1} ** #{num2} = #{num1**num2}")
end

prompt('Enter the first number:')
num1 = gets.chomp.to_f

prompt('Enter ther second number:')
num2 = gets.chomp.to_f

show_math(num1, num2)