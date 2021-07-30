arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
p arr.map do |arr|
  arr.sort {|el1, el2| el2 <=> el1}
end