
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = []
hsh.each do |_, array|
 array.each do |el| 
  el.each_char {|chr| %w(a e u o i).include?(chr) ? vowels << chr : next}
 end
end
p vowels.join

#option2
hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if %w(a e u i o).include?(char)
    end
  end
end
