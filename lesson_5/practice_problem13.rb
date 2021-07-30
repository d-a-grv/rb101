arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
p (arr.sort {|a, b| a.select(&:odd?) <=> b.select(&:odd?)})

#option 2
p (arr.sort_by {|sub_arr| sub_arr.select(&:odd?)})