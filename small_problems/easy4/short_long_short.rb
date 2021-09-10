def short_long_short(str1, str2)
  case str1.length <=> str2.length
  when -1
    str1.concat(str2, str1)
  when 1
    str2.concat(str1, str2)
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"