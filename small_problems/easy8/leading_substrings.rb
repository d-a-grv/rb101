def leading_substrings(string)
  substrings = []
  
  string.length.times do |n|
    substrings << string[0, n + 1]
  end

  substrings
end

def substrings(string)
  substrings_arr = []
  
  string.length.times do |n|
    current_substring = string.chars.drop(n).join
    substrings_arr << leading_substrings(current_substring)
  end

  substrings_arr.flatten
end


def palindromes(string)
  substrings_arr = substrings(string)
  palindromes = []

  substrings_arr.each do |substring|
    next if substring.length == 1
    palindromes << substring if substring.reverse == substring
  end

  palindromes
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]