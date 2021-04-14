# Convert a Signed Number to a String!
=begin
Algorithm
  if integer is negative, multiply by -1
  case to determine sign to prepend
  integer to string
  concatenate sign
=end

STRING_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  string = ""
  
  loop do
    integer, remainder = integer.divmod(10)
    string.prepend(STRING_DIGITS[remainder])
    break if integer == 0
  end

  string
end

def signed_integer_to_string(integer)
  case
  when integer < 0
    sign = '-'
    integer = integer * -1
  when integer > 0 then sign = "+"
  else sign = ''
  end
  
  sign + integer_to_string(integer)
end

# The book solution uses the spaceship operator:
def signed_integer_to_string(integer)
  case integer <=> 0 # +1 if greater, -1 if less, 0 if equal
  when +1 then "+#{integer_to_string(integer)}"
  when -1 then "-#{integer_to_string(-integer)}"
  else         "#{integer_to_string(integer)}"
  end
end
  

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# my solution was basically the further exploration
