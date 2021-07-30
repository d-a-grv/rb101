arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
p (arr.each_with_object({}) do |el, hash|
  hash[el[0]] = el[1]
end)