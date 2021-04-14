=begin
Problem
  Write a method that takes two strings as arguments, determines the longest of the two strings
  And then returns the result of concatenating the shorter string, the longer string, and the shorter string again.
  You may assume the strings are different lengths.
  
Examples/Test Cases
  short_long_short('abc', 'defgh') == "abcdefghabc"
  short_long_short('abcde', 'fgh') == "fghabcdefgh"
  short_long_short('', 'xyz') == "xyz"
  
Data Structures
  Inputs are two strings
  Output is a concatenated string
  
Algorithm
  have two parameters
  determine which is shorter and have conditional flow to concatenate (not destructively)
=end

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"