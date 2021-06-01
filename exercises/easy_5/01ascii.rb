# Problem
  # Write a method that determines and returns the ASCII string value of a string 
  # that is passed in as an argument. The ASCII string value is the sum of the ASCII 
  # values of every character in the string. (You may use String#ord to determine 
  # the ASCII value of a character.)
# Examples / Test Cases
  # ascii_value('Four score') == 984
  # ascii_value('Launch School') == 1251
  # ascii_value('a') == 97
  # ascii_value('') == 0
# Data Structures
  # Input: string
  # Output: integer (sum)
# Algorithm
  # Taking a string as the argument of a method
  # iterate through every character of the string
  # determine the ASCII value of each character
  # Either store that value in an array, or add it to a initialized sum
  # return the sum of the ASCII values in the string
# Code with intent

def ascii_value(string)
  sum = 0
  string.chars.each do |character| # there is also String#each_char method
    sum += character.ord
  end
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration:
# ord is a string method that returns the integer ordinal of a one character string
# if the string is more than one character, it only gives for the first character
# an empty string produces an error
# chr is an integer method that gives the character represented by encoding, will only be one character
# therefore, if you to "Test".ord.chr it will return "T" since ord give you the integer of the 
# first character and chr returns the character back based on the integer
# Example: "Test".ord.chr == "This is the same".ord.chr