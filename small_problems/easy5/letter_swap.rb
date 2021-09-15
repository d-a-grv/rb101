
def swap(str)
  str = str.split.map do |word|
    word = word.chars
    first = word.shift
    last = word.pop
    word.prepend(last).append(first).join
  end
  str.join(" ")
end

#LS
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'