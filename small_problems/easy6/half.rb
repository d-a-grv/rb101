def halvsies(array)
  half_length = (array.length.to_f / 2).round
  #final_array = 
  [array.take(half_length), array.drop(half_length)]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]