=begin
Problem
  Write a method that takes one argument, a string containing one or more words,
  and returns the given string with words that contain five or more characters reversed.
  Each string will consist of only letters and spaces.
  Spaces should be included only when more than one word is present.

Examples/Test Case
  puts reverse_words('Professional')          # => lanoisseforP
  puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
  puts reverse_words('Launch School')         # => hcnuaL loohcS

Data Structure
  You may assume the argument is a valid string with words delimited by spaces.
  Output a valid string with words also delimited by spaces. Words with 5+ characters are reversed.

Algorithm
  Turn the string into an array with each word at an index using split(' ')
  Iterate through array.
  If word has 5+ characters, call the reverse method on it.
  Join the array to make it one string again.
=end

def reverse_words(string)
  string.split.each { |element| element.reverse! if element.length >= 5 }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('this is my personal test of the method')