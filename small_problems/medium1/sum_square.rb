def sum_square_difference(int)
  num_arr = (1..int).to_a

  square_sums = num_arr.sum ** 2
  sum_squares = num_arr.map {|num| num**2}.sum

  square_sums - sum_squares
end



p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150