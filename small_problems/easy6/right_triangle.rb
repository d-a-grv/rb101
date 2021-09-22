def triangle(int, position)
  star = "*"

  int.times do |num|
    puts star.rjust(int)
    star += "*"
  end
end



triangle(5)
triangle(9)