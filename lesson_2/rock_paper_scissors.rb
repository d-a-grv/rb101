require 'yaml'

VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_PAIRS = { r_sc: %w(rock scissors),
              p_r: %w(paper rock),
              sc_p: %w(scissors paper),
              l_sp: %w(lizard spock),
              l_p: %w(lizard paper),
              r_l: %w(rock lizard),
              sc_l: %w(scissors lizard),
              sp_r: %w(spock rock),
              sp_sc: %w(spock scissors),
              p_sp: %w(paper spock) }

ACTION_MESSAGE = YAML.load_file('rps_messages.yml')

WIN_SCORE = 3

def clear_screen
  system('clear')
end

def prompt(message)
  puts "=> #{message}"
end

def who_wins?(player, computer)
  player_pair = [player, computer]
  computer_pair = [computer, player]

  if WIN_PAIRS.value?(player_pair)
    'player'
  elsif WIN_PAIRS.value?(computer_pair)
    'computer'
  else
    'tie'
  end
end

def action(player, computer)
  pair1 = [player, computer]
  pair2 = [computer, player]

  if WIN_PAIRS.value?(pair1)
    ACTION_MESSAGE[WIN_PAIRS.key(pair1).to_s]
  elsif WIN_PAIRS.value?(pair2)
    ACTION_MESSAGE[WIN_PAIRS.key(pair2).to_s]
  else
    ACTION_MESSAGE['tie']
  end
end

clear_screen
prompt('Welcome to Rock, Paper, Scissors, Lizard, Spock')
prompt("To win, you have to get #{WIN_SCORE} points. Good luck! (Press ENTER to continue)")
continue_input = gets.chomp

loop do
  score = { player: 0,
            computer: 0 }

  loop do
    clear_screen

    prompt('Choose your weapon: rock, paper, scissors, lizard or Spock:')
    player_choice = ''
    loop do
      player_choice = gets.chomp.downcase

      if player_choice == 's'
        prompt('Did you mean to choose scissors or Spock?')
        redo
      end

      VALID_CHOICES.each do |each_choice|
        if each_choice.start_with?(player_choice)
          player_choice = each_choice
        end
      end

      break if VALID_CHOICES.include?(player_choice)
      prompt('Your choice is not valid. Try again:')
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{player_choice}; computer chose #{computer_choice}")

    result = ''
    case who_wins?(player_choice, computer_choice)
    when 'player'
      result = 'You get a point!'
      score[:player] += 1
    when 'computer'
      result = 'Computer gets a point!'
      score[:computer] += 1
    when 'tie'
      result = "It's a tie."
    end

    message = action(player_choice, computer_choice) + result

    prompt(message)

    prompt('--------------------')
    prompt('Score:')
    prompt("User: #{score[:player]}")
    prompt("Computer: #{score[:computer]}")
    if score[:player] == WIN_SCORE
      prompt("Thank you for playing! You won.")
      break
    elsif score[:computer] == WIN_SCORE
      prompt("Thank you for playing! Computer won.")
      break
    end

    prompt('Ready for the next round? (Press ENTER to continue)')
    continue_input = gets.chomp
    break if continue_input.downcase.start_with?('stop')
  end
  prompt('Would you like to play again? (YES to play again)')
  again = gets.chomp
  break unless again.downcase.start_with?('yes')
end

prompt('Thank you for playing! Live long and prosper!')
