# If you take a number like 735291, and rotate it to the left, you get 352917. 
# If you now keep the first digit fixed in place, and rotate the remaining digits, 
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. 
# Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, 
# keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. 
# The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation 
# of that argument. You can (and probably should) use the rotate_rightmost_digits 
# method from the previous exercise.

# Note that you do not have to handle multiple 0s.

def rotate_array(array)
  copy = array.dup
  popped = copy.shift
  copy << popped
end

def rotate_rightmost_digits(integer, digit)
  digit_array = integer.digits.reverse
  append = rotate_array(digit_array[-digit..])
  (digit_array[0..(-digit - 1)] + append).join.to_i
end

def max_rotation(number)
  digits = number.to_s.length
  loop do # book solution uses #downto to iterate through
    number = rotate_rightmost_digits(number, digits) #(reassigning number in the loop)
    digits -= 1
    break if digits <= 1 # rotating the last digit doesn't change anything
  end
  number
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration
# Assume you do not have the rotate_rightmost_digits or rotate_array methods. 
# How would you approach this problem? Would your solution look different? 
# Does this 3 part approach make the problem easier to understand or harder?

# There is an edge case in our problem when the number passed in as the argument 
# has multiple consecutive zeros. Can you create a solution that preserves zeros?

# F.E. not attempted at this time, but splitting the problem up into three parts
# definitely makes things easier. It is good to remember to break problems down
# into manageable, logical chunks to solve. 

# I probably would have broken the problem down as well, but not sure if in those
# same chunks. It would have taken longer, too.
