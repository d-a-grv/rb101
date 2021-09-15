=begin
  The time of day can be represented as the number of minutes before or after midnight. 
  If the number of minutes is positive, the time is after midnight. 
  If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this 
minute-based format and returns the time of day in 24 hour format (hh:mm). 
Your method should work with any integer input.

input: integer
output: string representation of numbers

rules:
-input can be a negative or a positive integer
-the default time is "00:00"

Data Structure:
string
integer

Algorithm:
-init var current_time to an empty array
-init var (hours) to array of int from 0 to 23
- init var (minutes) to array of int from 0 to 59
- if input int is > than 60, init var (input_hour) to input integer divided by 60, if not init it 0
- if input int is < than 60, init var (input_minutes) to input integer, if not init var (input_minutes) to input integer modulo 60
- use number referenced by (input_hour) as an index to extract the hour from (hours)
- append the result to (current_time)
- do the same with (minutes)
- transform numbers in (current_time) to str
-if any element in (current_time) is less than 10, add 0 before it
-join the elements in (current_time) with : as a delimeter
  
=end

def time_of_day(int)
  current_time = []
  hours = (0..23).to_a
  minutes = (0..59).to_a
  input_to_hour = 0
  input_to_minutes = 0

  if int < 0 && int > -60
    input_to_minutes = int
    input_to_hour = -1
  elsif int >= 60 || int <= -60
    input_to_hour = int / 60
    input_to_hour %= 24 if input_to_hour > 23 || input_to_hour < -23
    input_to_minutes = int % 60
  else
    input_to_minutes = int
  end

  current_time << hours[input_to_hour].to_s
  current_time << minutes[input_to_minutes].to_s

  current_time.map! do |time|
    time = "0" + time if time.length < 2
    time
  end

  p current_time.join(":")
end

#LS
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end


def after_midnight(time)
  time = time.split(":").map(&:to_i)

  result = time[0] * 60 + time[1]

  result % 1440
end

def before_midnight(time)
  return 1440 - after_midnight(time) if after_midnight(time) > 60
  after_midnight(time) % 1440
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
p before_midnight('23:00')
p after_midnight('00:60')