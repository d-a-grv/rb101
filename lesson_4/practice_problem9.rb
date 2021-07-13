words = "the flintstones rock"

#non-destructive
p words.split.map { |word| word.capitalize }.join(' ')
p words
#destructive
p words.gsub!(words, words.split.map(&:capitalize).join(' '))
p words
