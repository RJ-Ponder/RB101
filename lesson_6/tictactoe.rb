require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
DEFEND_COMBOS = {
  [1, 2] => 3, [1, 3] => 2, [1, 4] => 7, [1, 5] => 9,
  [1, 7] => 4, [1, 9] => 5, [2, 3] => 1, [2, 5] => 8,
  [2, 8] => 5, [3, 5] => 7, [3, 6] => 9, [3, 7] => 5,
  [3, 9] => 6, [4, 5] => 6, [4, 6] => 5, [4, 7] => 1,
  [5, 6] => 4, [5, 7] => 3, [5, 8] => 2, [5, 9] => 1,
  [6, 9] => 3, [7, 8] => 9, [7, 9] => 8, [8, 9] => 7
}
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, p_score, c_score, t_games)
  system 'clear'
  puts "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}. " \
  "First to 5 wins."
  puts "Score => Player: #{p_score}, Computer: #{c_score}, Ties: #{t_games}"
  puts ""
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(empty_squares, punctuation = ', ', conjunction = 'or')
  last_square = empty_squares[-1]

  if empty_squares.size <= 1
    empty_squares
  elsif empty_squares.size == 2
    empty_squares.insert(-2, " #{conjunction} ")
  else
    empty_squares.map! { |element| element.to_s << punctuation }
    empty_squares.insert(-2, "#{conjunction} ").pop
    empty_squares.insert(-1, last_square)
  end

  empty_squares.join
end

def place_piece!(brd, curr_player)
  if curr_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(curr_player)
  if curr_player == 'Player'
    'Computer'
  else
    'Player'
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def attack(brd)
  attack_squares = []

  opportunities = WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2
  end

  opportunities.each do |line|
    line.each do |square|
      attack_squares << square if brd[square] == INITIAL_MARKER
    end
  end

  attack_squares.empty? ? nil : attack_squares
end

def defend(brd)
  defend_squares = []

  threats = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2
  end

  threats.each do |line|
    line.each do |square|
      defend_squares << square if brd[square] == INITIAL_MARKER
    end
  end

  defend_squares.empty? ? nil : defend_squares
end

def computer_places_piece!(brd)
  # order of precedence: attack, defend, center, corners, random
  square = if !!attack(brd)
             attack(brd).sample
           elsif !!defend(brd)
             defend(brd).sample
           elsif empty_squares(brd).include?(5)
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_score = 0
computer_score = 0
tie_games = 0

loop do
  board = initialize_board

  puts "Who goes first? Enter: Player (p), Computer (c), Random (r)"
  current_player = gets.chomp

  current_player = if current_player.downcase.start_with?('r')
                     ['Player', 'Computer'].sample
                   elsif current_player.downcase.start_with?('c')
                     'Computer'
                   else
                     'Player'
                   end

  loop do
    display_board(board, player_score, computer_score, tie_games)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, player_score, computer_score, tie_games)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won that round!"
    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end
  else
    prompt "It's a tie!"
    tie_games += 1
  end

  if player_score == 5
    prompt "Player is the ultimate winner!"
    prompt "Final Score => Player: #{player_score}, " \
    "Computer: #{computer_score}, Ties: #{tie_games}"
    break
  elsif computer_score == 5
    prompt "Sorry. The Computer is the ultimate winner."
    prompt "Final Score => You: #{player_score}, " \
    "Computer: #{computer_score}, Ties: #{tie_games}"
    break
  end

  prompt "Play next round? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
