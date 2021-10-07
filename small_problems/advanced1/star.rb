def star(num)
  middle = num / 2
  star = '*'
  
  num.times do |counter|
    first_last = " " * num
    first_last[counter] = star
    first_last[-counter.next] = star
    first_last[middle] = star
    puts counter == middle ? star*num : first_last
  end
end


star(7)
  
 star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

