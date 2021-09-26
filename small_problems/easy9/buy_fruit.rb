def buy_fruit(array)
  result = []
  
  array.each do |subarr|
    subarr[1].times { |_| result << subarr[0] }
  end

  result
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]