=begin
Problem
  Build a program that randomly generates and prints Teddy's age.
  To get the age, you should generate a random number between 20 and 200.
Examples/Test Cases
  Output: Teddy is 70 years old!
Data Structures
  String with randomly generated integer between 20 and 200.
Algorithm
  Generate a random number between 20 and 200.
  Concatenate the number in the string to display his age in a sentence.
=end

def display_teddy_age
  age = rand(20..200)
  puts "Teddy is #{age} years old!"
end

display_teddy_age

# Further Exploration
def display_name_age
  puts "Enter name to find age:"
  name = gets.chomp
  name = "Teddy" if name == ''
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

display_name_age
