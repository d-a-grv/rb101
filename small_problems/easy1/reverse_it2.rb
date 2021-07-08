def reverse_words(str)
  words = []
  str.split.each do |each_word|
    each_word.reverse! if each_word.size >= 5
    words << each_word
  end
  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS