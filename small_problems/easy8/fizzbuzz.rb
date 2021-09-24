def fizzbuzz(first, last)
  fizz = 'Fizz'
  buzz = 'Buzz'

  (first..last).to_a.each do |int|
    if int % 15 == 0
      puts fizz + buzz
    elsif int % 5 == 0 
      puts buzz
    elsif int % 3 == 0
      puts fizz
    else
      puts int
    end
  end
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz