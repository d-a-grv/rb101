arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
p (arr.map do |hsh|
  hsh.transform_values {|value| value + 1 }
end)
p arr