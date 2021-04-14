=begin
Problem
  Write a method that searches for all multiples of 3 or 5 that lie between 1 and the parameter
  Then it computes the sum of those multiples
  You may assume that the number passed in is an integer greater than 1
Examples / Test Cases
  multisum(3) == 3
  multisum(5) == 8
  multisum(10) == 33
  multisum(20) == 98
  multisum(1000) == 234168
Data Structures
  input is an integer, output is an integer
Algorithm
  Create an inclusive range using the parameter and convert to array
  Iterate over the array, saving all perfectly divisible nubmers by 3 or 5 into an array
  Sum the array
=end

def multisum(integer)
  range = 1..integer
  range.to_a.select { |element| element % 3 == 0 || element % 5 == 0 }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(20) == 98
p multisum(1000) == 234168