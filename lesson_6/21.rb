require 'pry'

SUITS = %w(Diamonds Spades Hearts Clubs)

CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

LIMIT = 21

def clear_display
  system 'clear'
end

def prompt(msg)
  puts "=> #{msg}"
end

def div
  puts ''
end

def pause
  div
  loop do
    prompt('Press ENTER to continue:')
    break if gets.chomp.empty?
  end
end

# rubocop:disable Metrics/MethodLength
def display_rules
  clear_display
  prompt("There's two roles: a dealer and a  player. "\
        "Both are initially dealt 2 cards. "\
        "The player can see their 2 cards "\
        "but only can see one of the dealer's cards.")
  div
  prompt("The goal is to get as close to 21 as possible. "\
        "If you get more, then you 'bust' and lose.")
  prompt("Cards 2-10 are worth what they are. J, Q and K are 10 points. "\
        "And Ace can be either 1 or 11 depending on whether "\
        "it's going to get one's score over the limit or not.")
  div
  prompt("The player goes first. They can decide to 'hit' or 'stay'. "\
        "A hit means getting another card. "\
        "They can hit as many times as they want. "\
        "The turn is over when the player either busts or stays. "\
        "If the player busts, the game is over and the dealer won.")
  prompt("The dealer's turn starts when the player decides to stay.")
  div
  prompt("When both the player and the dealer stays, it's time to compare the "\
        "total value of the cards and see who has the highest.")
end
# rubocop:enable Metrics/MethodLength

def user_needs_rules?
  prompt("Do you need to read the rules first?")
  answer = ''
  loop do
    prompt("(say R to see rules or press ENTER to continue)")
    answer = gets.chomp.downcase
    break if answer.empty? || answer == 'r'
  end
  answer == 'r'
end

def display_welcome
  clear_display
  prompt('Welcome to the game of Twenty-One.')
  div
  display_rules if user_needs_rules?
  div
  prompt("Good luck!")
  pause
end

def initialize_deck
  SUITS.product(CARDS).shuffle
end

def deal_hand(deck)
  hand = Array.new

  until hand.size == 2
    hand << deck.pop
  end

  hand
end

def a_an(card)
  if card.start_with?('A')
    'An '
  elsif card.to_i > 0
    ''
  else
    'A '
  end
end

def display_player_hand(player)
  clear_display
  prompt("Your hand:")
  player.each do |card|
    prompt("#{player.index(card) + 1}. #{a_an(card[1])}#{card[1]} "\
    "of #{card[0]}")
  end
  div
  prompt("Your points: #{count_total(player)}")
  div
  div
end

def display_hands(player, dealer)
  display_player_hand(player)

  prompt("Dealer's hand:")
  prompt("1. #{a_an(dealer[0][1])}#{dealer[0][1]} of #{dealer[0][0]}")
  prompt("2. **only visible to dealer**")
  div
  puts '--------------------------------'
  div
end

def display_open_hands(player, dealer)
  display_player_hand(player)

  prompt("Dealer's hand:")
  dealer.each do |card|
    prompt("#{dealer.index(card) + 1}. #{a_an(card[1])}#{card[1]} "\
    "of #{card[0]}")
  end
  div
  prompt("Dealer's points: #{count_total(dealer)}")
  div
  puts '--------------------------------'
  div
end

def hit_stay_valid_input(answer)
  loop do
    answer = gets.chomp.downcase
    break if answer == 'hit' || answer == 'stay'
    prompt('Invalid option. Try again:')
  end
  answer
end

def hit_or_stay(player, dealer, deck)
  loop do
    prompt('Do you want to hit or stay?')
    answer = hit_stay_valid_input(answer)
    break if answer == 'stay'
    hit!(player, deck)
    display_hands(player, dealer)
    break if bust?(player)
  end
end

def hit!(hand, deck)
  card = deck.sample
  hand << card
  update_deck!(deck, card)
end

def cards_to_points(card)
  if card.last.to_i > 0
    card.last.to_i
  elsif card.last == 'Ace'
    card.last
  else
    10
  end
end

def calculate_ace(points)
  pre_total = points.select { |el| el.is_a? Integer }.sum
  points[points.index('Ace')] = if (pre_total + 11) <= LIMIT
                                  11
                                else
                                  1
                                end
end

def count_total(hand)
  total = []
  hand.each do |card|
    total << cards_to_points(card)
  end
  calculate_ace(total) if total.include?('Ace')
  total.sum
end

def bust?(hand)
  count_total(hand) > 21
end

def display_player_bust
  prompt("You got more than #{LIMIT} points. So, you lose.")
end

def display_dealer_bust
  prompt("Dealer got more than #{LIMIT}. So, congrats - you win!")
end

def dealer_turn!(dealer, deck)
  until count_total(dealer) >= 17
    hit!(dealer, deck)
  end
end

def display_win(player, dealer)
  case count_total(player) <=> count_total(dealer)
  when -1
    prompt("Dealer has more points. You lose. Good luck next time!")
  when 0
    prompt("It's a tie.")
  when 1
    prompt("You have more points. You win!")
  end
end

display_welcome

loop do
  deck = initialize_deck

  player_hand = deal_hand(deck)

  dealer_hand = deal_hand(deck)

  display_hands(player_hand, dealer_hand)

  hit_or_stay(player_hand, dealer_hand, deck)

  display_hands(player_hand, dealer_hand)

  if bust?(player_hand)
    display_player_bust
  else
    prompt("It's dealer's turn now.")
    pause

    dealer_turn!(dealer_hand, deck)
    display_open_hands(player_hand, dealer_hand)
    if bust?(dealer_hand)
      display_dealer_bust
    else
      display_win(player_hand, dealer_hand)
    end
  end

  div
  prompt("Would you like to play again? (YES to continue)")
  answer = gets.chomp.downcase

  break unless answer == 'yes'
end
div
prompt("Goodbye! Thanks for playing.")
