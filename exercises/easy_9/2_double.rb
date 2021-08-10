# A double number is a number with an even number of digits whose left-side digits 
# are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 
# are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless 
# the argument is a double number; double numbers should be returned as-is.

def twice(number)
  string = number.to_s
  middle_index = string.length / 2
  if string.length.odd?
    number * 2
  elsif string[0, middle_index] == string[middle_index, middle_index] 
    number
  else
    number * 2
  end
end

# rather than counting out the length, it's better to go to the end using a range
# and -1. This eliminates the difference in length when it's an odd length.
# string[0..middle - 1] == string[middle..] or string[middle..-1]
# the only edge case is a single digit number where you can set a ternary
# and set it equal to '' if you want.

p twice(37) #== 74
p twice(44) #== 44
p twice(334433) #== 668866
p twice(444) #== 888
p twice(107) #== 214
p twice(103103) #== 103103
p twice(3333) #== 3333
p twice(7676) #== 7676
p twice(123_456_789_123_456_789) #== 123_456_789_123_456_789
p twice(5) #== 10
