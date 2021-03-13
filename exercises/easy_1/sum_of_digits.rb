=begin
Problem
  Write a method that takes one argument, a positive integer,
  and returns the sum of its digits.
Examples/Test Cases
  The following print true:
  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45
Data Structures
  Input is a positive integer
  Output is a positive integer
Algorithm
  Was going to convert to string, split, use array to convert to numbers, reduce, but...
  digits method for integers returns an array of the individual digits.
  Then sum them using reduce.
=end

def sum(integer)
  integer.digits.reduce(:+) #there is also a sum method in the Array class.
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
