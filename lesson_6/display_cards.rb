require 'pry'

player_cards = ['A', 'J', 7]
dealer_cards = ['A', 1, 2]

def display(player_cards, dealer_cards)
  system 'clear'
  d1 = dealer_cards[1..-1].map { |card| "+" + "-" * card.to_s.size + "+" }.join(' ') 
  d2 = dealer_cards[1..-1].map { |card| "|" + card.to_s + "|" }.join(' ')
  
  p1 = player_cards.map { |card| "+" + "-" * card.to_s.size + "+" }.join(' ') 
  p2 = player_cards.map { |card| "|" + card.to_s + "|" }.join(' ')
  
  puts 'Dealer'
  puts "+-+ " + d1
  puts "|X| " + d2
  puts "+-+ " + d1
  puts 'Player'
  puts p1
  puts p2
  puts p1
end

display(player_cards, dealer_cards)

def total(cards)
  no_aces = cards.reject { |card| card == 'A' }
  no_aces_total = no_aces.map { |card| card.to_i == 0 ? 10 : card }.sum
  number_of_aces = cards.count('A')
  
  one_value_aces = 0
  total = nil
  loop do
    total = no_aces_total + (number_of_aces - one_value_aces) * 11 + one_value_aces
    break if total <= 21 || one_value_aces >= number_of_aces
    one_value_aces += 1
  end
  
  total
end

# hand1 = [5, 'A'] # 16
# hand2 = [5, 'A', 'A'] # 17
# hand3 = [5, 'A', 'A', 6] # 13
# hand4 = [5, 'A', 'A', 6, 2] # 15
# hand5 = [5, 'A', 'A', 6, 2, 'A'] # 16
# hand6 = ['Q', 'A'] # 21
# hand7 = ['Q', 'A', 'A'] # 12
# hand8 = ['Q', 'Q', 'A'] # 21
# hand9 = ['K', 'Q', 'A', 4] # 25
# hand10 = [9, 9, 'A', 4]

# p total(hand1)
# p total(hand2)
# p total(hand3)
# p total(hand4)
# p total(hand5)
# p total(hand6)
# p total(hand7)
# p total(hand8)
# p total(hand9)
# p total(hand10)