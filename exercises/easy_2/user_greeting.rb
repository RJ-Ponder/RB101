=begin
Problem
  Write a program that will ask for user's name.
  The program will then greet the user.
  If the user writes "name!" then the computer yells back to the user.
Examples/Test Cases
  What is your name? Bob
  Hello Bob.
  
  What is your name? Bob!
  HELLO BOB. WHY ARE WE SCREAMING?
Data Structures
  Input is from user and is a string
  Output is a string
Algorithm
  Ask for name
  Conditional that test whether it ends in a !
  If so, yell back
  If not, display name calmly
=end

puts "What is your name?"
name = gets.chomp

if name.end_with?("!")
  name.gsub!("!",'') # using chop would be a little simpler
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
