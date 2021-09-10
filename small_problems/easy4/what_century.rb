def century(year)
  return '1st' if year < 101
  removed_int = year % 100
  year /= 100
  year += 1 if removed_int > 0
  year_to_str(year)
end

def year_to_str(year)
  century_str = if year > 100
                  year % 100
                else
                  year
                end

  str_ending = str_suffix(century_str)
  
  year.to_s + str_ending
end

def str_suffix(str)
  if (4..20).cover?(str)
    "th"
  elsif str % 10 == 1
    "st"
  elsif str % 10 == 2
    "nd"
  elsif str % 10 == 3
    "rd"
  end
end
  
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'