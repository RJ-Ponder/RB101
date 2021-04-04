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

def prompt(message)
  puts "=> #{message}"
end

def valid_number(number)
  if number.to_i <= 0
    false
  elsif number.to_f != number.to_i
    false
  else
    true
  end
end

integer = 1

loop do
  prompt("Please enter an integer greater than 0:")

  integer = gets.chomp

  break if valid_number(integer)

  prompt("Please enter a valid number.")
end

range = (1..integer.to_i)

loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  
  operation = gets.chomp.downcase
  
  if operation == 's'
    sum = range.to_a.sum
    prompt("The sum of the integers between 1 and #{integer} is #{sum}.")
    break
  elsif operation == 'p'
    product = range.reduce(:*)
    prompt("The product of the integers between 1 and #{integer} is #{product}.")
    break
  else
    prompt("Please select a valid operation.")
  end
end
# originally I used while and a counter to get the product, but the reduce, inject Enumerable method is simpler.
# could also use up_to and a block like the book solution.
