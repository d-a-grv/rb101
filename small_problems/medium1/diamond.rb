=begin
-create an array of integers from 1 to given int
-select only odd ints
-iterate through the array


=end

def outline(star, counter)
  (star*counter).chars.map.with_index do |el, idx|
    idx == 0 || idx == (counter-1) ? el : ' '
  end.join
end

def print_stars(star, counter, int)
    string = outline(star, counter)
    puts string.center(int)
end

def diamond(int)
  star = '*'

  1.upto(int) do |counter|
    print_stars(star, counter, int) if counter.odd?
  end
  (int-2).downto(1) do |counter|
    print_stars(star, counter, int) if counter.odd?
  end
end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)