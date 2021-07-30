def create_uuid
  first = []
  second = []
  third = []
  fourth = []
  fifth = []

  hexadec_chars = ('a'..'f').to_a + (1..9).to_a
  8.times do
    first << hexadec_chars.sample
  end
  4.times do
    second << hexadec_chars.sample
    third << hexadec_chars.sample
    fourth << hexadec_chars.sample
  end
  12.times do
    fifth << hexadec_chars.sample
  end

  puts "#{first.join}-#{second.join}-#{third.join}-#{fourth.join}-#{fifth.join}"
end

create_uuid