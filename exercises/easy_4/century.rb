=begin
Problem
  Write a method that takes a year as input and returns the century
  The return value should be a string that begins with the century number
  and ends with st, nd, rd, or th as appropriate
  New centuries begin with 01. (1901 - 2000 is 20th century)
Examples/Test Cases
  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'
Data Structures
  Integer input, string output with appropriate suffix
Algorithm
  Since centuries are 100 years long, divide the input by 100 using integer division and add 1
  Assign the result to a proper suffix using case and when
=end

def century(year)
  century = ((year - 1) / 100) + 1
  century_string = century.to_s
  century_array = century.digits
  if century_array.first == 1 && century_array[1] != 1
    century_string + 'st'
  elsif century_array.first == 2 && century_array[1] != 1
    century_string + 'nd'
  elsif century_array.first == 3 && century_array[1] != 1
    century_string + 'rd'
  else
    century_string + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'