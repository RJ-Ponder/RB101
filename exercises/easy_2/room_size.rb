=begin
Problem
  Build a program that asks a user for the length and width of a room
  in meters and then displays the area of the room in both square
  meters and square feet.
  1 square meter == 10.7639 square feet
Examples/Test Cases
  length = 10, width = 7 => The area of the room is 70 sq m (753.47 sq feet).
Data Structures
  Input width and length
  Output string with area and conversion
Algorithm
  Get user input for length and width
  Convert to a number to perform the * operation
  Convert to sq feet
  Display both results in a sentence.
=end

def calculate_room_size
  puts "Enter the length of the room in meters:"
  length = gets.chomp
  puts "Enter the width of the room in meters:"
  width = gets.chomp
  
  sq_meters = (length.to_f * width.to_f).round(2)
  sq_feet = (sq_meters * 10.7639).round(2)
  
  puts "The area of the room is #{sq_meters} square meters (#{sq_feet} square feet)."
end

calculate_room_size
# the above didn't have to me in a method
# the conversion should be saved as a CONSTANT
