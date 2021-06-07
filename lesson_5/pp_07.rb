# Given this code, what would be the final values of a and b? Try to work this out without running the code.
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# used irb for help:
# a = 2
# b = [5, 8]
# arr = [2, [5, 8]], where a points to 2 and b points to [5, 8]
# arr[0] += 2, reassigns the first element to 4, but a is unaffected
# arr[1][0] -= a, since a is still 2, first element of inner array is reassigned to 3
# Now,
# arr = [4, [3, 8]]
# a = 2
# b = [3, 8], this is a change because the array was mutated.

p a
p b
p arr

# The value of a didn't change because we are not referencing a at any point. 
# This code arr[0] += 2 was modifying the array, arr not a. In effect we are 
# assigning a new object at that index of the array so that instead of arr[0] 
# containing a it now contains 4 - we can check this by looking at the value of arr:

# arr # => [4, [3, 8]]

# The value of b did change because b is an array and we are modifying that 
# array by assigning a new value at index 0 of that array.