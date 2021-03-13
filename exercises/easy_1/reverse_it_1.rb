=begin
Problem
  Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples/Test Case
  The following should print true:
  puts reverse_sentence('') == ''
  puts reverse_sentence('Hello World') == 'World Hello'
  puts reverse_sentence('Reverse these words') == 'words these Reverse'

Data Structure
  You may assume the argument is a valid string with words delimited by spaces.
  Output a valid string with words also delimited by spaces.

Algorithm
  Turn the string into an array with each word at an index using split(' ')
  Determine the last place index.
  Starting with the last place index and working backwards to 0, add the words into another array.
  
  Join the elements of the array back into a string using join.
=end

def reverse_sentence(string)
  array_of_string = string.split(' ')
  reverse_array = []

  loop do
    break if array_of_string.length == 0
    reverse_array << array_of_string.pop
  end
  
  reverse_array.join(' ')
end

# didn't realize there was a reverse method for arrays -_-
# entire method could be string.split.reverse.join(' ')

puts reverse_sentence('you will try')
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'