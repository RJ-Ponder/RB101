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

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# book solution utilizes this construct:
# arr = [1, 2, 3, 4, 5]
# arr[0..2] = [6, 7, 8]
# arr = [6, 7, 8, 4, 5]

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end
