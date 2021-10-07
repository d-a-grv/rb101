def egyptian(rat)
  denominators = []
  subtrahend_denominator = 0

  until rat.numerator == 1
    subtrahend_denominator += 1
    subtrahend = Rational(1, subtrahend_denominator)
    next if (rat - subtrahend) < 0
    rat -= subtrahend
    denominators << subtrahend_denominator
  end

  denominators << rat.denominator
end

def unegyptian(denominators)
  rat = 0.to_r
  
  (0...denominators.length).each do |idx|
    rat += Rational(1, denominators[idx])
    Rational(1, denominators[idx])
  end

  rat
end


p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)