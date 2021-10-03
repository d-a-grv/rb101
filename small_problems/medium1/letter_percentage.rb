def to_percent(string, range)
  ((string.count(range) / string.length.to_f) * 100).round(1)
end


def letter_percentages(string)
  { lowercase: to_percent(string, 'a-z'),
    uppercase: to_percent(string, 'A-Z'),
    neither: to_percent(string, '^a-zA-Z')
  }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}