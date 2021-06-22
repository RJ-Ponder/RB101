# Constant definitions
BUST_LIMIT = 21
DEALER_GOAL = 17
WINNING_SCORE = 5

DIAMOND = "\u2666"
CLUB = "\u2663"
HEART = "\u2665"
SPADE = "\u2660"

INITIALIZED_DECK = %W(
  2#{DIAMOND} 2#{CLUB} 2#{HEART} 2#{SPADE}
  3#{DIAMOND} 3#{CLUB} 3#{HEART} 3#{SPADE}
  4#{DIAMOND} 4#{CLUB} 4#{HEART} 4#{SPADE}
  5#{DIAMOND} 5#{CLUB} 5#{HEART} 5#{SPADE}
  6#{DIAMOND} 6#{CLUB} 6#{HEART} 6#{SPADE}
  7#{DIAMOND} 7#{CLUB} 7#{HEART} 7#{SPADE}
  8#{DIAMOND} 8#{CLUB} 8#{HEART} 8#{SPADE}
  9#{DIAMOND} 9#{CLUB} 9#{HEART} 9#{SPADE}
  10#{DIAMOND} 10#{CLUB} 10#{HEART} 10#{SPADE}
  J#{DIAMOND} J#{CLUB} J#{HEART} J#{SPADE}
  Q#{DIAMOND} Q#{CLUB} Q#{HEART} Q#{SPADE}
  K#{DIAMOND} K#{CLUB} K#{HEART} K#{SPADE}
  A#{DIAMOND} A#{CLUB} A#{HEART} A#{SPADE}
)

# Method definitions
def prompt(msg)
  puts "=> #{msg}"
end

def shuffle!(cards)
  cards.shuffle!
end

def deal(deck, hand, cards)
  cards.times { hand << deck.pop }
end

def format_ends(cards, hidden = false)
  if hidden
    cards[1..-1].map { |card| "+" + "-" * card.to_s.size + "+" }.join(' ')
  else
    cards.map { |card| "+" + "-" * card.to_s.size + "+" }.join(' ')
  end
end

def format_middle(cards, hidden = false)
  if hidden
    cards[1..-1].map { |card| "|" + card.to_s + "|" }.join(' ')
  else
    cards.map { |card| "|" + card.to_s + "|" }.join(' ')
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display(dealer_hand, player_hand, hidden = false)
  sleep(1)
  system 'clear'
  puts 'Dealer hand:'
  if hidden
    puts "+-+ " + format_ends(dealer_hand, hidden)
    puts "|?| " + format_middle(dealer_hand, hidden)
    puts "+-+ " + format_ends(dealer_hand, hidden)
  else
    puts format_ends(dealer_hand)
    puts format_middle(dealer_hand)
    puts format_ends(dealer_hand)
  end

  puts 'Your hand:'
  puts format_ends(player_hand)
  puts format_middle(player_hand) + " (Total: #{total(player_hand)})"
  puts format_ends(player_hand)
  sleep(1)
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def total(hand)
  convert_hand = hand.map { |card| card[0] }
  no_aces = convert_hand.reject { |card| card == 'A' }
  no_aces_total = no_aces.map { |card| card.to_i <= 1 ? 10 : card.to_i }.sum
  number_of_aces = convert_hand.count('A')

  aces_as_one = 0
  total = nil
  loop do
    total = no_aces_total + (number_of_aces - aces_as_one) * 11 + aces_as_one
    break if total <= BUST_LIMIT || aces_as_one >= number_of_aces
    aces_as_one += 1
  end

  total
end

def busted?(hand)
  total(hand) > BUST_LIMIT
end

def determine_winner(player_hand, dealer_hand)
  if busted?(player_hand)
    'Dealer'
  elsif busted?(dealer_hand)
    'Player'
  elsif total(player_hand) < total(dealer_hand)
    'Dealer'
  elsif total(player_hand) > total(dealer_hand)
    'Player'
  else
    'Tie'
  end
end

def display_round_result(player_hand, dealer_hand)
  if determine_winner(player_hand, dealer_hand) == 'Player'
    prompt "You won the hand!"
  elsif determine_winner(player_hand, dealer_hand) == 'Dealer'
    prompt "Dealer won the hand."
  else
    prompt "It's a push."
  end
end

# Welcome screen
system 'clear'
prompt "Welcome to Blackjack!"
prompt "Try to win #{WINNING_SCORE} hands before the dealer."
sleep(2)

# Main game loop
loop do
  dealer_score = 0
  player_score = 0
  pushes = 0

  prompt "Dealing first hand..."
  sleep(1.5)

  loop do
    # Prepare deck
    ordered_deck = INITIALIZED_DECK

    player_hand = []
    dealer_hand = []

    # Shuffle deck
    deck = shuffle!(ordered_deck)

    # Deal and display cards
    deal(deck, player_hand, 2)
    deal(deck, dealer_hand, 2)
    display(dealer_hand, player_hand, true)

    # Player turn
    player_move = nil

    loop do
      prompt "Hit or Stay?"
      player_move = gets.chomp

      if player_move.downcase.start_with?('h')
        deal(deck, player_hand, 1)
        prompt 'Dealing a card...'
        display(dealer_hand, player_hand, true)
      elsif !(player_move.downcase.start_with?('s'))
        prompt "Please choose to either (h)it or (s)tay."
      end

      break if player_move.downcase.start_with?('s') || busted?(player_hand)
    end

    # Result of player turn
    sleep(1.5)
    if busted?(player_hand)
      prompt "You busted."
      display(dealer_hand, player_hand)
      display_round_result(player_hand, dealer_hand)
    else
      player_stays = true
      prompt "You chose to stay."
    end

    # Dealer turn
    if player_stays
      prompt "Revealing dealer card..."
      display(dealer_hand, player_hand)

      loop do
        if total(dealer_hand) < DEALER_GOAL
          deal(deck, dealer_hand, 1)
          prompt 'Dealing a card.'
          sleep(0.5)
          prompt '.'
          sleep(0.5)
          prompt '..'
          sleep(0.5)
          prompt '...'
          display(dealer_hand, player_hand)
        end

        break if total(dealer_hand) >= DEALER_GOAL || busted?(dealer_hand)
      end

      # Result of dealer turn
      sleep(1.5)
      if busted?(dealer_hand)
        prompt "Dealer busted."
        sleep(1.5)
        display_round_result(player_hand, dealer_hand)
      else
        dealer_stays = true
        prompt "Dealer stays."
      end

      if player_stays && dealer_stays
        display_round_result(player_hand, dealer_hand)
      end
    end

    # Score round
    if determine_winner(player_hand, dealer_hand) == 'Player'
      player_score += 1
    elsif determine_winner(player_hand, dealer_hand) == 'Dealer'
      dealer_score += 1
    else
      pushes += 1
    end

    break if player_score == WINNING_SCORE || dealer_score == WINNING_SCORE

    puts "( Won: #{player_score} | Lost: #{dealer_score} | Pushed: #{pushes} )"
    prompt "Continue with another hand? (y to continue, n to quit)"
    answer_hand = gets.chomp

    break unless answer_hand.downcase.start_with?('y')
  end

  # Show winner of game
  if player_score == WINNING_SCORE
    prompt "Congrats! You are the winner!"
  elsif dealer_score == WINNING_SCORE
    prompt "Sorry. Dealer is the winner. Better luck next time."
  end

  prompt "Start another round? (y or n)"
  answer_game = gets.chomp

  break unless answer_game.downcase.start_with?('y')
end

prompt "Thanks for playing Blackjack! Goodbye."
sleep(1)
