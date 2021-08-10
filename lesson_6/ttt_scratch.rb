# notes on the splat operator if needed:

# Variable Length Argument List, Asterisk Operator

# The last parameter of a method may be preceded by an asterisk(*), which is
# sometimes called the 'splat' operator. This indicates that more parameters may
# be passed to the function. Those parameters are collected up and an array is
# created.

# The asterisk operator may also precede an Array argument in a method call.
# In this case the Array will be expanded and the values passed in as if they
# were separated by commas.


def computer_places_piece!(brd)
  opportunities = WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2
  end
  
  attack_squares = []
  
  opportunities.each do |line|
    line.each do |square|
      attack_squares << square if brd[square] == INITIAL_MARKER
    end
  end
  
  threats = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2
  end
  
  defend_squares = []
  
  threats.each do |line|
    line.each do |square|
      defend_squares << square if brd[square] == INITIAL_MARKER
    end
  end
  
  if !(attack_squares.empty?)
    square = attack_squares.sample
  elsif !(defend_squares.empty?)
    square = defend_squares.sample
  elsif empty_squares(brd).include?(5)
    square = 5
  # elsif brd[5] == PLAYER_MARKER
  #   square = empty_squares(brd).select { |sq| sq.odd? }.sample
  else
    square = empty_squares(brd).sample
  end
  
  brd[square] = COMPUTER_MARKER
end


def computer_places_piece!(brd)
  # order of precedence: attack, defend, center, corners, random
  if !!attack(brd)
    square = attack(brd).sample
  elsif !!defend(brd)
    square = defend(brd).sample
  elsif empty_squares(brd).include?(5)
    square = 5
  # elsif brd[5] == PLAYER_MARKER
  #   square = empty_squares(brd).select(&:odd?).sample
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

  # loop do
  #   display_board(board, player_score, computer_score, tie_games)

  #   if first_move.downcase.start_with?('y')
  #     player_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)
  
  #     computer_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)
  #   else
  #     computer_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)
      
  #     display_board(board, player_score, computer_score, tie_games)
      
  #     player_places_piece!(board)
  #     break if someone_won?(board) || board_full?(board)
  #   end
  # end