def is_an_ip_address?(number)
  (0..255).cover?(number)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  dot_separated_words.each do |num|
    return false unless is_an_ip_address?(num.to_i)
  end
  
  true
end

p dot_separated_ip_address?('1.2.3.4')