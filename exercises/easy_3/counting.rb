=begin
Problem
  Write a program that will ask a user for an input of a word or
  multiple words and give back the number of characters.
  Spaces should not be counted as a character.
  
Examples/Test Cases
  Please write word or multiple words: walk
  There are 4 characters in "walk".
  Please write word or multiple words: walk, don't run
  There are 13 characters in "walk, don't run".

Data Structures
  Input is a string
  Output is an integer that is interpolated in a string
  
Algorithm
  Ask for user input
  Split(' ') to get an array of just the words
  Join with no spaces
  chars to separate into array of all the characters
  count method on the array.
=end

puts "Please write word or multiple words:"
string = gets.chomp

characters = string.split(' ').join('').chars.count
# a simpler way is string.delete(' ').size (didn't realize size counted characters in a string.)

puts "There are #{characters} characters in \"#{string}\"."