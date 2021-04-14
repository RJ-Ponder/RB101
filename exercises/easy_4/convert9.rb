# Convert a Number to a String!

DIGITS = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }

def integer_to_string(integer)
  integer.digits.reverse.map { |item| DIGITS[item] }.join
end
  
p integer_to_string(12345)
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# I also could have eliminated the DIGITS hash and just called digits to turn into array, reverse, and join...
# BUT join essentially turns the array into a string, so defeats the purpose of not calling to_s on the integer directly
# I saw the book solution but will try to reproduce without looking here:

STRING_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  
  string = ""
  
  loop do
    number, remainder = integer.divmod(10)
    string.prepend(STRING_DIGITS[remainder])
    
    break if number == 0
    
    integer = number
  end
    
  string
end

p integer_to_string(12345)
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Further exploration:
# How many mutating string methods that do not end with ! => << ; 
# Any with ! but doesn't have non-mutating form? =>
# Does the Array class have any methods that fit this pattern? => 
# Does the Hash class have any methods that fit this pattern? => 

# The general assumption is if a method has a non-mutating form, the mutating form will end with !
# If the method doesn't have a non-mutating form, it might not end in !
# The same thing should apply to hashes and arrays