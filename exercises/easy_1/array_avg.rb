=begin
Problem
  Write a method that takes one argument, an array containing integers,
  and returns the average of all numbers in the array.
  The array will never be empty and the numbers will always be positive integers.
  Your result should also be an integer.
Examples/Test Cases
  The following should print true: 
  puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40
Data Structures
  Input is an array of positive integers.
  Output is an integer
Algorithm
  Iterate through the array, summing the integers
  Divide the sum by the size or count of the array
  Make sure integer division is performed.
=end

def average(numbers_array)
  sum = 0
  numbers_array.each { |integer| sum += integer }
  sum.to_f / numbers_array.count # further exploration added .to_f
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40