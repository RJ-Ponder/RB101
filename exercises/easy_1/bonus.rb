=begin
Problem
  Write a method that takes two arguments, a positive integer and a boolean,
  and calculates the bonus for a given salary.
  If the boolean is true, the bonus should be half of the salary.
  If the boolean is false, the bonus should be 0.
Examples/Test Cases
  Following should print true:
  puts calculate_bonus(2800, true) == 1400
  puts calculate_bonus(1000, false) == 0
  puts calculate_bonus(50000, true) == 25000
Data Structures
  Input two arguments, positive integer and boolean
  Output positive integer or 0 if boolean is false
Algorithm
  Simple conditional that divides the integer by 2 if the boolean is true.
  Else returns 0
=end

# refactored the code from an if conditional to ternary statement
def calculate_bonus(salary, gets_bonus = true)
  gets_bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
