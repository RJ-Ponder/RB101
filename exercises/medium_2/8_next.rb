=begin
A featured number (something unique to this exercise) is an odd number that is 
a multiple of 7, and whose digits occur exactly once each. So, for example, 49 
is a featured number, but 98 is not (it is not odd), 97 is not (it is not a 
multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next 
featured number that is greater than the argument. Return an error message if 
there is no next featured number.

Problem
- return the next highest number from given that fulfills the requirements:
  - odd
  - multiple of 7
  - digits occur exactly once each (no repeating digits)
- return error message if none higher
=end

def featured(integer)
  return "No possible featured number." if integer >= 9_999_999_999
  integer += 1
  loop do
    if integer.even?
      integer += 1
      next
    elsif integer % 7 != 0
      integer += 1
      next
    elsif integer.digits.any? { |num| integer.digits.count(num) != 1 }
      integer += 1
      next
    else
      return integer
    end
  end
end

# def featured(number)
#   number += 1
#   number += 1 until number.odd? && number % 7 == 0

#   loop do
#     number_chars = number.to_s.split('')
#     return number if number_chars.uniq == number_chars
#     number += 14
#     break if number >= 9_876_543_210
#   end

#   'There is no possible number that fulfills those requirements.'
# end

p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements