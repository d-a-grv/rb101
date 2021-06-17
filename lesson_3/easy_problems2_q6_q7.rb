flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#1
flintstones << 'Dino'

#2
flintstones.append('Dino')

#3
flintstones.push('Dino')

#-------2 items

#1
flintstones.append('Dino', 'Hoppy')

#2
flintstones.push('Dino', 'Hoppy')

#3
flintstones.concat(%w(Dino Hoppy))