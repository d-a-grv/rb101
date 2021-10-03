def friday_13th(year)
  instances = (1..12).to_a.map {|month| Time.new(year, month, 13)}

  counter = 0
  instances.each {|date| counter += 1 if date.friday?}
  counter
end

def friday_13th(year)
  counter = 0
  1.upto(12) { |month| counter += 1 if Time.new(year, month, 13).friday? }
  counter
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2