# Convert a String to a Signed Number!
=begin
Problem
  Same as convert7, but this time be able to process a sign (+) or (-) in front of the string
  If no sign given, return a positive integer
  Assume that you are given a valid number.
Examples / Test Cases
  string_to_signed_integer('4321') == 4321
  string_to_signed_integer('-570') == -570
  string_to_signed_integer('+100') == 100
=end

def string_to_integer(string)
  digit_array = string.bytes.map { |element| element - 48 }
  
  digit_values = []
  digit_array.reverse.each_with_index { |element, index| digit_values << (element * 10 ** index) }
  digit_values.sum
end

def string_to_signed_integer(string)
  case string[0]
  when '+' then string_to_integer(string[1..-1])
  when '-' then -string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Further Exploration. Refactor to only call string_to_integer once and string[1..-1] once. (looked at other student's solution)
def string_to_signed_integer(string)
  sign = string[0] == '-' ? -1 : 1
  unsigned = string.delete("+-")
  string_to_integer(unsigned) * sign
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# My original solution below
def string_to_signed_integer(string)
  
  digits = string.chars
  digit_values = []
  
  if digits.first == '+'
    digits.shift
    digit_array = digits.join.bytes.map { |element| element - 48 }
    digit_array.reverse.each_with_index { |element, index| digit_values << (element * 10 ** index) }
    digit_values.sum
    
  elsif digits.first == '-'
    digits.shift
    digit_array = digits.join.bytes.map { |element| element - 48 }
    digit_array.reverse.each_with_index { |element, index| digit_values << (element * 10 ** index) }
    digit_values.sum * -1
    
  else
    digit_array = string.bytes.map { |element| element - 48 }
    digit_array.reverse.each_with_index { |element, index| digit_values << (element * 10 ** index) }
    digit_values.sum
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100