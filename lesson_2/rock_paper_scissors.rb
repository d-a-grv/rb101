VALID_SCHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def display_result(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt('You won!')
  elsif (player == 'rock' && computer == 'paper') ||
       (player == 'paper' && computer == 'scissors') ||
       (player == 'scissors' && computer == 'rock')
      prompt('Computer won!')
  else
    prompt("It's a tie")
  end
end

loop do
  prompt('Choose your weapon: rock, paper or scissors:')
  choice = ''

  loop do
    choice = gets.chomp.downcase

    break if VALID_SCHOICES.include?(choice)
    prompt('Your choice is not valid. Try again:')
  end

  computer_choice = VALID_SCHOICES.sample

  prompt("You chose #{choice}; computer chose #{computer_choice}")

  display_result(choice, computer_choice)

  prompt('Would you like to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you. Good bye!')
