def string_to_integer(str)
  value = 0
  str.chars.map do |int| 
    next if %w(- +).include? int
    current_int = int.ord - 48 
    value = 10 * value + current_int
  end
  return -value if str[0] == '-'
  value
end

def integer_to_string(int)
  int = -int if int < 0
  to_str = int.digits.reverse
  to_str.map! do |int| 
    next if int == '-'
    (int + 48).chr
  end
  to_str.join
end

def signed_integer_to_string(int)
  if int > 0
    '+' + integer_to_string(int)
  elsif int < 0
    '-' + integer_to_string(int)
  else
    integer_to_string(int)
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('-570') == -570
p string_to_integer('+123') == 123

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'