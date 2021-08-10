# Write a method that takes a sentence string as input, and returns the same 
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# word_to_digit('Please call me at five five five one two three four. Thanks.')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# This was my original solution, but I realized it doesn't account for capitalization.
# Reading about gsub, I realize it is really flexible, so next solution tries to utilize that.
NUMBERS = {
          "zero" => "0", "one" => "1", "two" => "2", "three" => "3", "four" => "4", 
          "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"
          }
# This was my solution, but is a little off from the book's. Mostly that I iterated through
# the string, looking for words to replace, rather than through the hash and replacing
# anything in the string that matched. I also should surround the word with /b boundary
# to not replace something like this: freight => fr8
def word_to_digit(string)
  string.split.each do |word|
    word_only = word.downcase.delete("^a-z")
    if NUMBERS.keys.include?(word_only)
      string.gsub!(/#{word_only}/i, NUMBERS[word_only])
    end
  end
  string
end

# book solution:
def word_to_digit_2(string)
  NUMBERS.each_key do |word|
    string.gsub!(/\b#{word}\b/i, NUMBERS[word]) # I added the case insensitive part
  end
  string
end

string = 'Please call me at FIVE five five one two three four. Thanks.'
p word_to_digit_2(string)
p string # shows that the original string was modified.

# Further Exploration
  # There are many ways to solve this problem and different varieties of it. Suppose, 
  # instance, that we also want to replace uppercase and capitalized words. (done, with case insensitive i)
  
  # Can you change your solution so that the spaces between consecutive numbers are removed? 
  # Suppose the string already contains two or more space separated numbers (not words); 
  # can you leave those spaces alone, while removing any spaces between numbers that you create?
  
  # What about dealing with phone numbers? Is there any easy way to format the result 
  # to account for phone numbers? For our purposes, assume that any 10 digit number 
  # is a phone number, and that the proper format should be "(123) 456-7890".

# F.E. not attempted at this time.
  # Seems a little too difficult at this time to remove spaces between digits that were replaced
  # and formatting a phone number
  # possibly revisit after reading the REGEX book
