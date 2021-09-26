=begin
  P: given an array of strings, return an array/arrays containing strings that have the same letters

  D: arrays

  A:

-set (anagrams) to empty arr
- start a loop that continues for as many times as many element there are in the array
  -set (counter) to 0
  -iterate through given array
    -skip the element if element at index (counter) is the same
    -check if the current word has the same characters as the word at index (counter)
      -if it does, append it to the (anagrams)
-return (anagrams)

=end

def get_anagrams(arr)
  anagrams = [[]]

  arr.length.times do |counter|
    anagrams << [] unless anagrams.include?([])
    arr.each do |word|
      
      anagrams[counter] << word if word.delete(arr[counter]).empty?
    end
  end

  anagrams.uniq.each { |arr| p arr }
end



words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

get_anagrams(words)