PLAYER_MARKER = 'x'
COMPUTER_MARKER = 'o'
WIN_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
             [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
             [[1, 5, 9], [3, 5, 7]]
WIN_POINTS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def div
  puts ''
end

def clear_display
  system 'clear'
end

def pause
  prompt('Press any key to continue:')
  gets.chomp
end

def joinor(arr, punctuation=',', last='or')
  if arr.length > 1
    arr[0...-1].join(punctuation + ' ') + " #{last} #{arr[-1]}"
  else
    arr.join
  end
end

def display_board(brd)
  clear_display
  puts "You're '#{PLAYER_MARKER}'. Computer is '#{COMPUTER_MARKER}'."
  div
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]} "
  puts "---+---+---"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]} "
  puts "---+---+---"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]} "
  div
end

def initialize_board
  (1..9).each_with_object({}) { |num, hsh| hsh[num] = ' ' }
end

def empty_squares(brd)
  brd.keys.select { |key| brd[key] == ' ' }
end

def who_goes_first
  prompt('Would you like to go first or second? (1 or 2 to continue):')
  loop do
    choice = gets.chomp
    return choice if choice == '1' || choice == '2'
    prompt('Invalid choice. Try again:')
  end
end

def place_piece!(brd, who_plays)
  if who_plays == '1'
    user_marks_square!(brd)
  elsif who_plays == '2'
    computer_marks_square!(brd)
  end
end

def alternate_player(who_plays)
  who_plays == '1' ? '2' : '1'
end

def player_goes_first(brd, scr)
  loop do
    game_display(brd, scr)
    user_marks_square!(brd)
    game_display(brd, scr)
    break if someone_won_round?(brd)
    computer_marks_square!(brd)
    game_display(brd, scr)
    break if someone_won_round?(brd) || full?(brd)
  end
end

def computer_goes_first(brd, scr)
  loop do
    game_display(brd, scr)
    computer_marks_square!(brd)
    game_display(brd, scr)
    break if someone_won_round?(brd) || full?(brd)
    user_marks_square!(brd)
    game_display(brd, scr)
    break if someone_won_round?(brd) || full?(brd)
  end
end

def user_marks_square!(brd)
  puts "Choose a square to mark (#{joinor(empty_squares(brd))}):"
  choice = gets.chomp.to_i
  brd[choice] = PLAYER_MARKER
end

def find_threat(lines, brd)
  if brd.values_at(*lines).count(COMPUTER_MARKER) == 2
    brd.select { |k, v| lines.include?(k) && v == ' ' }.keys.first
  elsif brd.values_at(*lines).count(PLAYER_MARKER) == 2
    brd.select { |k, v| lines.include?(k) && v == ' ' }.keys.first
  end
end

def computer_marks_square!(brd)
  square = nil
  WIN_COMBOS.each do |line|
    square = find_threat(line, brd)
    break if square
  end

  if !square
    square = if brd[5] == ' '
               5
             else
               square = empty_squares(brd).sample
             end
  end

  brd[square] = COMPUTER_MARKER
end

def computer_won?(brd)
  WIN_COMBOS.each do |combo|
    if brd.values_at(*combo).count(COMPUTER_MARKER) == 3
      return true
    end
  end
  false
end

def player_won?(brd)
  WIN_COMBOS.each do |combo|
    if brd.values_at(*combo).count(PLAYER_MARKER) == 3
      return true
    end
  end
  false
end

def someone_won_round?(brd)
  player_won?(brd) || computer_won?(brd)
end

def full?(brd)
  !!empty_squares(brd).empty?
end

def someone_won_game?(score)
  score.values.any?(WIN_POINTS)
end

def round_win_message(brd)
  if player_won?(brd)
    prompt('You get a point.')
  elsif computer_won?(brd)
    prompt('Computer gets a point.')
  else
    prompt("It's a tie.")
  end
end

def game_win_message(score)
  if score[:player] == WIN_POINTS
    prompt('Congrats. You won!')
  elsif score[:computer] == WIN_POINTS
    prompt('Computer won.')
  end
end

def update_score!(scr, brd)
  if player_won?(brd)
    scr[:player] += 1
  elsif computer_won?(brd)
    scr[:computer] += 1
  end
end

def display_score(scr)
  prompt('Current score:')
  prompt("Player: #{scr[:player]}")
  prompt("Computer: #{scr[:computer]}")
  div
end

def game_display(brd, scr)
  display_board(brd)
  display_score(scr)
end

loop do
  score = { player: 0, computer: 0 }
  
  clear_display
  prompt("We're playing til either you or computer gets #{WIN_POINTS} winning points. Good luck!")
  pause

  who_goes_first = who_goes_first()

  loop do
    board = initialize_board
    current_player = who_goes_first

    loop do
      game_display(board, score)
      place_piece!(board, current_player)
      game_display(board, score)
      current_player = alternate_player(current_player)
      break if someone_won_round?(board) || full?(board)
    end

    round_win_message(board)
    update_score!(score, board)
    pause
    display_board(board)
    display_score(score)
    break if someone_won_game?(score)
  end

  game_win_message(score)
  prompt('Would you like to play again?(Y to play again)')
  again = gets.chomp
  break unless again.downcase.start_with?('y')
end

prompt("Thank you for playing Tic Tac Toe. Goodbye!")
