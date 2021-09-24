def repeater(string)
  string.chars.map { |char| char*2 }.join
end

def double_consonants(string)
  string.chars.map do |char|
    char =~ /[aeuoi\d\W]/i ? char : char*2 
  end.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""