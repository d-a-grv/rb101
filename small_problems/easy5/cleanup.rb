def cleanup(dirty_str)
  dirty_chars = dirty_str.chars

  clean_chars = dirty_chars.map do |char|
    char = " " unless ('a'..'z').cover?(char)
    char
  end

  clean_str = ""
  clean_chars.each_with_index do |char, idx|
    clean_str << char unless (char == " ") && (clean_chars[idx + 1] == " ")
  end

  clean_str
end

#LS
def cleanup(text)
  text.gsub(/[^a-z]/, " ").squeeze(" ")
end

p cleanup("---what's my +*& line?") == ' what s my line '