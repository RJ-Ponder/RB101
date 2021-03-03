VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_ABBREVIATED = %w(r p s l k)

def prompt(message)
  puts("=> #{message}")
end

def convert_abbreviation(letter)
  letter_word_pairs = {
    'r' => 'rock',
    'p' => 'paper',
    's' => 'scissors',
    'l' => 'lizard',
    'k' => 'spock'
  }
  letter_word_pairs[letter]
end

winning_move_combinations = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['rock', 'scissors']
}

prompt("Welcome to rock, paper, scissors, lizard, spock!")
prompt("This game is best of five.")

player_score = 0
computer_score = 0

loop do
  player_choice = ''

  loop do
    prompt('Choose one: rock (r), paper (p), scissors (s),'\
      ' lizard (l), spock (k).')

    player_choice = gets.chomp.downcase

    if VALID_CHOICES.include?(player_choice)
      break
    elsif VALID_CHOICES_ABBREVIATED.include?(player_choice)
      player_choice = convert_abbreviation(player_choice)
      break
    else
      prompt("Please make a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts("You chose #{player_choice}; Computer chose #{computer_choice}.")

  if winning_move_combinations[player_choice].include?(computer_choice)
    prompt("You win!")
    player_score += 1
  elsif winning_move_combinations[computer_choice].include?(player_choice)
    prompt("Computer wins!")
    computer_score += 1
  else
    prompt("It's a tie!")
  end

  prompt("Score: You #{player_score}; Computer #{computer_score}")

  if player_score == 5
    prompt("You are the champion!")
    break
  elsif computer_score == 5
    prompt("Computer is the champion!")
    break
  else
    prompt("Continue playing to best of five? Enter to continue.")
    answer = gets.chomp
    break unless answer == ''
    system('clear')
  end
end

prompt("Thank you for playing. Goodbye!")
