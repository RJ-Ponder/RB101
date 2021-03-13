=begin
Problem
  Build a program that displays when the user will retire
  and how many years he has to work until retirement.
Examples/Test Cases
  What is your age? 30
  At what age would you like to retire? 70

  It's 2016. You will retire in 2056.
  You have only 40 years of work to go!
Data Strutures
  Input user current age and retirement age
  Output string with current year, retirement year,
  and number of years to work.
Algorithm
  Ask for user current age and retirement age
  Convert to integer
  Find difference between ages
  Find current year
  Add difference to current year
  Display all the results in an interpolated string.
=end

puts "What is your age?"
age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

working_years = retirement_age - age
year = Time.new.year
retirement_year = year + working_years

puts "It's #{year}. You will retire in #{retirement_year}."
puts "You have only #{working_years} years of work to go!"
