# Convert a String to a Number!
=begin
Problem
  Write a method that takes a String of digits, and returns the appropriate number as an integer.
  You may not use .to_i or Integer()
  Don't worry about leading +, - or invalid characters
Examples/Test Cases
  string_to_integer('4321') == 4321
  string_to_integer('570') == 570
Data Structures
  input is a string, output is an integer
Algorithm
  Use bytes to convert the string into individual values for each digit
  Use map to subtract 48
  Figure out which place each integer is in and multiply it by that power (10^0, 1, 2, 3, etc.)
  Sum the array to get the final integer.
=end

def string_to_integer(string)
  digit_array = string.bytes.map { |element| element - 48 }
  
  digit_values = []
  digit_array.reverse.each_with_index { |element, index| digit_values << (element * 10 ** index) }
  digit_values.sum
end

p string_to_integer('12345')
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('02368406')

# Further Exploration -> hexadecimal to integer
DIGITS = { 
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, 
  "a" => 10, "b" => 11,  "c" => 12, "d" => 13, 
  "e" => 14, "f" => 15 
}

def hexadecimal_to_integer(hex)
  digits = hex.downcase.chars.map { |char| DIGITS[char] }
  
  digit_values = []
  digits.reverse.each_with_index { |element, index| digit_values << (element * 16 ** index) }
  digit_values.sum
end

p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('4d96fc5a2597dff7567e8c0d3e37e495')
p hexadecimal_to_integer('FFF')
p hexadecimal_to_integer('BEEF')
p hexadecimal_to_integer('facade')
p hexadecimal_to_integer('babe')