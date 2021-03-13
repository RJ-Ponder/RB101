=begin
Problem
  Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
Examples/Test Cases
    >> Please enter an integer greater than 0:
  5
  >> Enter 's' to compute the sum, 'p' to compute the product.
  s
  The sum of the integers between 1 and 5 is 15.
  
  
  >> Please enter an integer greater than 0:
  6
  >> Enter 's' to compute the sum, 'p' to compute the product.
  p
  The product of the integers between 1 and 6 is 720.
Data Structures
  User inputs as strings converted to integers
  Output is interpolate string with integer from either addition or multiplication operation
Algorithm
  Ask for integer greater than 0.
  Condtional tree: if s
    take the range of the numbers and add them all
    if p
    take the range and multiply
  else loop and ask for valid number.
  Display results.
=end

puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i
#validate_number

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp
#validate_operation

range = (1..integer)
count = 1
product = integer
if operation == 's'
  sum = range.to_a.sum
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
elsif operation == 'p'
  while count < integer
    product = product * (integer - count)
    count += 1
  end
  puts "The product of the integers between 1 and #{integer} is #{product}."
else
  puts "Please select a valid operation."
end
# above works, but no validation and there are simpler ways to do this. Use enumerable #inject (#reduce)
# could also use up_to and a block like the book solution.