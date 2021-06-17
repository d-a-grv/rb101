advice = "Few things in life are as important as house training your pet dinosaur."

#1
advice_arr = advice.split

better_advice = ''

advice_arr.each do |word|
  if word == 'important'
    better_advice << 'urgent' + ' '
    next
  else
    better_advice << word + ' '
end
end
=end

#2
better_advice = advice.split('important').insert(1, 'urgent').join

#3
advice.gsub('important', 'urgent')

p better_advice