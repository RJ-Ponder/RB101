=begin
Problem
  Write a method that takes any year greater than 0 as input,
  and returns true if the year is a leap year,
  and false if the year is not a leap year.
  Rule: leap year is evenly divisible by 4, except if divisible by 100,
  unless divisible by 400.
Examples/Test Cases
  leap_year?(2016) == true
  leap_year?(2015) == false
  leap_year?(2100) == false
  leap_year?(2400) == true
  leap_year?(240000) == true
  leap_year?(240001) == false
  leap_year?(2000) == true
  leap_year?(1900) == false
  leap_year?(1752) == true
  leap_year?(1700) == false
  leap_year?(1) == false
  leap_year?(100) == false
  leap_year?(400) == true
Data Structures
  input is an integer year, return value is a boolean
Algorithm
  If divisible by 400, then true
  Else if divisible by 100, false
  Else if divisible by 4, true
=end

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0 # I had an extra unnecessary conditional here
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

=begin
# Shorter Solution:
def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

# Further exploration (ended up taking from other students' solutions because I couldn't think)
# The order is important, if you had year % 100 conditional first, it would fail for years divisible by 400 as well.
# Reversing the order:

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      year % 400 == 0 ? true:false
    else
      true
    end
  else
    false
  end
end

def leap_year?(year)
  return true if (year % 4 == 0 && year % 100 != 0)
  return true if (year % 100 == 0 && year % 400 == 0)
  false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

=end