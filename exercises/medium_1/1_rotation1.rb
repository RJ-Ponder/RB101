# Rotation (Part 1)
  # Write a method that rotates an array by moving the first element to the 
  # end of the array. The original array should not be modified.
  # Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(array)
  copy = array.dup
  popped = copy.shift
  copy << popped
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# book solution slices out everything except first element and then joins
# first element to that
# array[1..-1] + [array[0]]

# Further Exploration
  # Write a method that rotates a string instead of an array.
  # Do the same thing for integers.
  # You may use rotate_array from inside your new method.

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_array(integer.digits.reverse).join.to_i
end

p rotate_string('abcde')
p rotate_integer(12345)
