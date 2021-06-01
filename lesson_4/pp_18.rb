# What happens when we modify an array while we are iterating over it?

# first code block:
  # 1 prints, 1 is removed
  # The iteration moves to the second item in the array, which is now 3
  # 3 prints, 2 is removed
  # Two iterations have occurred, which is the length of the array, so the iterations end
  # numbers is now [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

p numbers

# second code block:
  # 1 prints, 4 is removed
  # 2 prints, 3 is removed
  # iteration ends, because the array has a length only of 2
  # numbers is now [1, 2]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

p numbers

# from this and the book's solution we learn that
# 1. each is compared against the current length of the array in real time
# 2. iterators do not work on a copy of the original array
# 3. iterators do not work from stale meta-data (lenght) about the array.

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end