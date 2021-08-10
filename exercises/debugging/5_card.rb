=begin
We started working on a card game but got stuck. Check out why the code below raises a TypeError.

Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?
=end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup, # these all reference the same variable, need to clone or dup them
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit] # cards references the same variable initialized earlier
  cards.shuffle!
  player_cards << cards.pop
end

p deck[:hearts]
p deck[:diamonds]
p deck[:clubs]
p deck[:spades]

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  new = remaining_cards.map do |card| # need to save and use the return value of the map call
    score(card)
  end

  sum += new.sum
end

puts sum