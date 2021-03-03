VALID_CHOICES = [:rock, :paper, :scissors, :lizard, :spock]
VALID_CHOICES_ABBREVIATED = [:r, :p, :s, :l, :k]

def prompt(message)
  puts("=> #{message}")
end

def convert_abbreviation(abbreviation)
  convert_hash = {
                  r: "rock",
                  p: "paper",
                  s: "scissors",
                  l: "lizard",
                  k: "spock"
                  }
  convert_hash[abbreviation]
end

def display_score(player_wins, computer_wins)
  if player_wins
    #increment score
  elsif computer_wins
    #increment score
  else
    # don't increment score bc of tie.
  end
  puts "Score: You (#{player_wins}); Computer (#{computer_wins}})"
end

=begin
def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end
=end

possible_moves = { rock: ['lizard', 'scissors'],
                   paper: ['rock', 'spock'],
                   scissors: ['paper', 'lizard'],
                   lizard: ['spock', 'paper'],
                   spock: ['rock', 'scissors']
                  }

player_score = 0
computer_score = 0

loop do
  choice = ''
  
  loop do
    prompt("Choose one: rock (r), paper (p), scissors (s), lizard (l), spock (k).")
    
    choice = gets.chomp.downcase.to_sym

    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_CHOICES_ABBREVIATED.include?(choice)
      choice = convert_abbreviation(choice).to_sym
      break
    else
      prompt("Please make a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample.to_sym
  
  puts("You chose #{choice}; Computer chose #{computer_choice}.")
  
  if possible_moves[choice].include?(computer_choice.to_s)
    prompt("You win!")
    player_score += 1
  elsif possible_moves[computer_choice].include?(choice.to_s)
    prompt("You lose!")
    computer_score += 1
  else
    prompt("It's a tie!")
  end

  prompt("Score: You #{player_score}; Computer #{computer_score}")

  # display_results(choice, computer_choice)
  if player_score == 5
    prompt("You are the champion!")
    break
  elsif computer_score == 5
    prompt("Computer is the champion!")
    break
  else
    prompt("Continue best of five?")
    answer = gets.chomp
    break unless answer.downcase().start_with?('y')
  end
end

prompt("Thank you for playing. Goodbye!")
