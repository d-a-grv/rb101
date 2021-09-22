DEGREE = "\xC2\xB0"
SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE

def place_in_range(number)
  until (0..360).cover?(number)
    if number < 0
      number += 360
    else
      number -= 360
    end
  end
  number
end

def dms(number)
  number = place_in_range(number) unless (0..360).cover?(number)
  total_seconds = (number * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) #== %(30°00'00")
p dms(76.73)# == %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773)# == %(93°02'05")
p dms(0)# == %(0°00'00")
p dms(360)# == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")