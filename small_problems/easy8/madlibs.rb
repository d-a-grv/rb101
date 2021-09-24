def prompt(msg)
  puts "=> #{msg}"
end

prompt "Enter a noun:"
noun = gets

prompt "Enter a verb:"
verb = gets

prompt "Enter an adjective:"
adjective = gets

prompt "Enter an adverb:"
adverb = gets

puts ""
prompt "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hialrious"