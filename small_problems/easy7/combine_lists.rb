def interleave(arr1, arr2)
  final_arr = []
  index = 0
  while index < arr1.length
    final_arr << arr1[index]
    final_arr << arr2[index]
    index += 1
  end
  final_arr
end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']