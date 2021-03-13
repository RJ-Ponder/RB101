=begin
Problem
Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples/Test Case
12345 == [1, 2, 3, 4, 5]     # => true
7 == [7]                     # => true
375290 == [3, 7, 5, 2, 9, 0] # => true
444 == [4, 4, 4]             # => true

Data Structure
You may assume the argument is a valid positive integer value.
Output an array with each digit as its own object in the array.

Algorithm
Take an integer and convert to a string
Split the string by 'letter'
Map through the array of 'letters' to convert it back to a digit.
=end

def digit_list(integer)
  integer.to_s.split('').map { |digit| digit.to_i }
  # could be simplified further using chars and &: => number.to_s.chars.map(&:to_i)
end

# brute for method could be by dividing by 10 and putting that remainder digit into an array.

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

p digit_list(125363698762)