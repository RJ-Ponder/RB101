# Problem
  # Given a string that consists of some words (all lowercased) and an
  # assortment of non-alphabetic characters, write a method that returns that 
  # string with all of the non-alphabetic characters replaced by spaces. If one or 
  # more non-alphabetic characters occur in a row, you should only have one space 
  # in the result (the result should never have consecutive spaces).
# Examples / Test Cases
  # cleanup("---what's my +*& line?") == ' what s my line '
# Data Structures
  # Input: string, with non-alphanumeric characters
  # Output: modified string (mutated)
# Algorithm
  # Can identify alphanumeric characters (a..z) (A..Z) (0..9)

def cleanup(string)
  string.gsub!(/[^a-z]/i, ' ').squeeze(' ') # incorrectly included numbers in the regexp at first, fixed and now i shows case insensitve
end
# I also thought the problem wanted the same string, modified

p cleanup("---what's my +*& line?") == ' what s my line '

# old attempt before I found squeeze from docs:
# counter = 0
  # loop do
  #   break if string[counter] == nil
  #   if string[counter] == ' ' && string[counter + 1] == ' '
  #     string[counter] = ''
  #   end
  #   counter += 1
  # end
  # string
  
# TRY WRITING THIS WITHOUT REGEXP (don't look at book solution again yet)
def cleanup2(string)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  cleaned = []
  string.each_char do |char|
    if letters.include?(char)
      cleaned << char
    else
      cleaned << ' ' unless cleaned.last == ' '
    end
  end
  
  cleaned.join
end

p cleanup2("---what's my +*& line?") == ' what s my line '
