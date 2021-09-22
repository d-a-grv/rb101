def multiply_list(arr1, arr2)
  result = []

  arr1.each_with_index do |int, idx|
    result << int * arr2[idx]
  end

  result
end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |subarr| subarr.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]