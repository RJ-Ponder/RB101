=begin
Write a method that returns the number of Friday the 13ths in the year given 
by an argument. You may assume that the year is greater than 1752 
(when the United Kingdom adopted the modern Gregorian Calendar) and that it 
will remain in use for the foreseeable future.

Problem
- return the number of Friday the 13ths in a given year
Data structure
- input: integer representing the year
- output: integer representing the number of Friday the 13th that year
Algorithm
- require 'date'
- loop through the months in the year
- if it is friday the 13th, then += 1
=end

# require 'time'
require 'date'

# p Date.today.strftime("%A")
# p Date.today.wday
# p Date.today.mday
# p Date.new(2015, 2, 13).friday?

def friday_13th(year)
  month = 1
  count = 0
  loop do
    count += 1 if Date.new(year, month, 13).friday?
    break if month == 12
    month += 1
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

=begin
Further Exploration
An interesting variation on this problem is to count the number of months that 
have five Fridays. This one is harder than it sounds since you must account for 
leap years.
=end