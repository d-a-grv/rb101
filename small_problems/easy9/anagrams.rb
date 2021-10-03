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