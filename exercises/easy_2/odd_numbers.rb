=begin
Problem
  Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.
Examples/Test Cases
  1
  3
  5
  7
  ...
Data Structures
  No input
  Output all integers on separate lines
Algorithm
  Given the range (1..99)
  Iterate through each number
  Print if the number is odd
=end

(1..99).each { |number| puts number if number.odd? }

# Further exploration
puts (1..99).to_a.select { |number| number.odd? }

1.upto(99) { |number| puts number if number.odd? }

value = 1
while value <= 99
  puts value
  value += 2
end