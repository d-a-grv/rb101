arr = ['10', '11', '9', '7', '8']

#option1
arr.sort { |num1, num2| num2.to_i <=> num1.to_i}

#option2
arr.map(&:to_i).sort.reverse.map(&:to_s)

