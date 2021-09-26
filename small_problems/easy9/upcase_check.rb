def uppercase?(str)
  str.chars.all? do |char|
    char =~ /[A-Z\W\d\s]/ 
  end
end

def uppercase?(string)
  string == string.upcase
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true