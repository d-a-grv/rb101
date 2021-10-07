def text_to_hash(text)
  text.split("\n").map do |line| 
    line = line.split(":")
    line.map do |el| 
      line[0] == el ? el.delete_suffix('s') : el.split
    end
  end.to_h
end

def madlibs(text_to_change, replacement_text)
  hash = text_to_hash(replacement_text)
  text_to_change.map do |line|
    hash.each do |key, arr|
      line.gsub!(/%{#{key}}/, arr.sample)
    end
    line
  end.join
end

to_change = File.readlines('madlibs2_text.txt')
replacements = File.read('madlibs2_replacement.txt')
puts madlibs(to_change, replacements)