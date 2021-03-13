=begin
Problem
Write a method that takes one integer argument, which may be positive, negative, or zero.
This method returns true if the number's absolute value is odd.
You cannot use the #odd? or #even? methods.

Examples/Test Case
2 => false
5 => true
-17 => true
-8 => false
0 => false

Data Structure
You may assume the argument is a valid integer value. Output a boolean value.

Algorithm
Check if the argument is less than 0 (negative)
If it is, take the absolute value by multiplying by -1.
Divide by 2 and determine remainder (or use modulo oeprator).
Output true if there is a remainder and false if no remainder.
=end

def is_odd?(integer)
  if integer < 0
    positive_integer = integer * -1
  else
    positive_integer = integer
  end

  positive_integer % 2 == 1
end
# made the integer positive to not run into % operator confusion.
# % works as intended here even with negative numbers.
# Remainder method could be used after converting to positive number.
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true