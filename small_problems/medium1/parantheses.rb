def balanced?(string)
  return false if string.count('(') != string.count(')')

  index1 = 0
  index2 = 0

  string.chars.each_with_index do |char, idx|
    index1 = idx if char == '('
    index2 = idx if char == ')'
  end
  
  index2 >= index1
end

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false