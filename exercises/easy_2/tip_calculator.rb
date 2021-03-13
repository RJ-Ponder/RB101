=begin
Problem
  Create a simple tip calculator.
  The program should prompt for a bill amount and a tip rate.
  The program must compute the tip and then display both the tip and the total amount of the bill.
Examples/Test Cases
  What is the bill? 200
  What is the tip percentage? 15
  
  The tip is $30.0
  The total is $230.0
Data Structures
  User inputs converted to floats
  Output are strings with calculations interpolated
Algorithm
  User input for bill and tip rate.
  Convert to floats
  Perform multiplication operation
  Display results with interpolation
=end

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percent = gets.chomp.to_f

tip = (bill * (tip_percent / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{sprintf("%.2f", tip)}", "The total is $#{sprintf("%.2f", total)}" #further exploration
