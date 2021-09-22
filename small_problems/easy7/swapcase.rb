def swapcase(str)
  str.chars.map { |letter| ('a'..'z').cover?(letter) ? letter.upcase : letter.downcase}.join
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'