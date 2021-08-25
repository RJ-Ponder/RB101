=begin
A friend of yours wrote a number guessing game. The first version he shows you picks a random number between 1 and a provided maximum number and offers you a given number of attempts to guess it.

However, when you try it, you notice that it's not working as expected. Run the code and observe its behavior. Can you figure out what is wrong?

A number of things are wrong:
1) the recursion makes it so a new number is chosen every time and the stack goes deeper and deeper
2) no break point if you win
3) the loop already does what you want
4) need play again option if you want to call the game again
=end
require 'pry'
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  p winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    if attempts > max_attempts
      puts "Sorry you lose."
      break
    end
    
    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      #guess_number(max_number, max_attempts)
    end
  end
  
  puts "Play again?"
  input2 = gets.chomp
  if input2 == "y"
    guess_number(max_number, max_attempts)
  else
    puts "Thanks for playing!"
  end
end

guess_number(10, 3)
