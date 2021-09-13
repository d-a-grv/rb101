require 'pry'

def running_total(arr)
  final_arr = []
  sum = 0

  for int in arr
    sum += int
    final_arr << sum
  end
  
  final_arr
end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

def running_total(arr)
  sum = 0
  arr.each_with_object([]) do |int, obj|
    sum += int
    obj << int
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []