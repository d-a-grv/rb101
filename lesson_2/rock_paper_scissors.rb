require 'yaml'

VALID_CHOICES = %w(rock paper scissors lizard Spock)

WIN_PAIRS = {
  'rock' => {
    'scissors' => 'crushes',
    'lizard' => 'crushes'
  },
  'paper' => {
    'rock' => 'covers',
    'Spock' => 'disproves'
  },
  'scissors' => {
    'paper' => 'cut',
    'lizard' => 'decapitate'
  },
  'lizard' => {
    'Spock' => 'poisons',
    'paper' => 'eats'
  },
  'Spock' => {
    'rock' => 'vaporizes',
    'scissors' => 'smashes'
  }
}

WIN_SCORE = 3

def clear_screen
  system 'clear'
end

def prompt(message)
  puts "=> #{message}"
end

def div
  puts ''
end

def enter_to_continue
  div
  prompt('Press ENTER to continue:')
  gets.chomp.downcase
end

def display_welcome
  clear_screen
  prompt('Welcome to Rock, Paper, Scissors, Lizard, Spock')
  prompt("To win, you have to get #{WIN_SCORE} points. Good luck!")
  enter_to_continue
end

def clarify
  prompt('Did you mean to choose scissors or Spock?')
  gets.chomp.downcase
end

def get_player_choice
  prompt('Choose your weapon: rock, paper, scissors, lizard or Spock:')
  player_choice = gets.chomp.downcase

  player_choice = clarify(player_choice) if player_choice == 's'

  VALID_CHOICES.each do |each_choice|
    if each_choice.downcase.start_with?(player_choice)
      player_choice = each_choice
    end
  end
  player_choice
end

def display_score(scr)
  prompt('--------------------')
  prompt('Score:')
  prompt("User: #{scr[:player]}")
  prompt("Computer: #{scr[:computer]}")
end

def determine_round_winner(player, computer)
  if WIN_PAIRS[player].key?(computer)
    'player'
  elsif WIN_PAIRS[computer].key?(player)
    'computer'
  else
    'tie'
  end
end

def someone_won?(scr)
  scr[:player] == WIN_SCORE || scr[:computer] == WIN_SCORE
end

def determine_game_winner(scr)
  if scr[:player] == WIN_SCORE
    'player'
  elsif scr[:computer] == WIN_SCORE
    'computer'
  end
end

def display_win_message(scr)
  div
  case determine_game_winner(scr)
  when 'player'
    prompt('Thank you for playing. You won!')
  when 'computer'
    prompt('Thank you for playing. Computer won!')
  end
end

def action(player, computer)
  player = player.capitalize if player == 'spock'
  computer = computer.capitalize if computer == 'spock'
  case determine_round_winner(player, computer)
  when 'player'
    "#{player.capitalize} #{WIN_PAIRS[player][computer]} #{computer}."
  when 'computer'
    "#{computer.capitalize} #{WIN_PAIRS[computer][player]} #{player}."
  when 'tie'
    'Looks like you both chose the same weapon.'
  end
end

display_welcome

loop do
  score = { player: 0,
            computer: 0 }

  loop do
    clear_screen

    player_choice = ''
    loop do
      player_choice = get_player_choice
      break if VALID_CHOICES.include?(player_choice)
      prompt('Your choice is not valid. Try again:')
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{player_choice}; computer chose #{computer_choice}")

    result = case determine_round_winner(player_choice, computer_choice)
             when 'player'
               score[:player] += 1
               'You get a point!'
             when 'computer'
               score[:computer] += 1
               'Computer gets a point!'
             when 'tie'
               "It's a tie."
             end

    message = action(player_choice, computer_choice) + ' ' + result

    prompt(message)

    display_score(score)

    break if someone_won?(score)

    prompt('Ready for the next round?')
    continue_input = enter_to_continue
    break if continue_input.downcase.start_with?('stop')
  end
  display_win_message(score)

  prompt('Would you like to play again? (YES to play again)')
  again = gets.chomp
  break unless again.downcase.start_with?('yes')
end

prompt('Thank you for playing! Live long and prosper!')
