=begin
Problem
  Write a method that takes one argument, a positive integer,
  and returns a string of alternating 1s and 0s, always starting with 1.
  The length of the string should match the given integer.

Examples/Test Case
  The following tests should print true:
  puts stringy(6) == '101010'
  puts stringy(9) == '101010101'
  puts stringy(4) == '1010'
  puts stringy(7) == '1010101'

Data Structure
  Input: assume always given a positive integer.
  Output: string starting with 1, alternating with 0, length equal to integer argument.

Algorithm
  Initialize a variable with the string '1'
  Loop with a counter starting at 0.
  When the counter is even, add 0 to the string variable.
  When the counter is odd, add 1 to the string variable. 
  When the counter is greater than the argument given, break.
=end

def stringy(integer)
  stringy = '1'
  counter = 2
  
  loop do
    if counter > integer
      break
    elsif counter.even?
      stringy << '0'
    else
      stringy << '1'
    end
    counter += 1
  end
  
  stringy
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(24)

# Further Exploration, using the book solution from memory:
def stringy_2 (integer, first_number = 1)
  numbers = []
  
  integer.times do |index|
    number = index.even? ? first_number : (1 - first_number)
    numbers << number
  end
  
  numbers.join('')
end

puts stringy_2(5)
puts stringy_2(5,0)