=begin
input: string
output: new str

P: take a string and return a new string that has all the consecutive repeated letters removed

D: string, array

A:
- turn the input string into an array of chars
- init a var (final_str) to an empty str
-iterate through the array 
  -push current element into (final_str) only if the next character is not the same
-return (final_str)

=end

def crunch(str)
  str = str.chars
  final_str = ""
  str.each_with_index do |char, idx|
    final_str << char unless str[idx + 1] == char
  end
  final_str
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''