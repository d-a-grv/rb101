require 'pry'

=begin
P: given an integer, find the first number in the fibonacci sequence that has that many digits
   fibonacci sequence is a sequence of numbers where each consecutive number is a sum of the previous two.

Data Structure: integers, strings

Algo:

-init a var (index) to 0
-init a var (first_num) to 1
-init a var (second_num) to 1
-init a var (new_num) to 0
-start a loop
  -increment (index) by one
  -reassign (new_num) to the sum of (first_num) and (second_num)
  -break the loop when the length of (new_num) is equal to the provided int
  -reassign (first_num) to (second_num)
  -reassign (second_num) to (new_num)
-return (index)

=end

def find_fibonacci_index_by_length(length)
  return 1 if length == 1
  index = 2
  first_num = 1
  second_num = 1
  new_num = 0
  loop do
    index += 1
    new_num = first_num + second_num
    return index if new_num.to_s.length == length
    first_num = second_num
    second_num = new_num
  end
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847