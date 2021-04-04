def user_number(sequence)
  puts "==> Enter the #{sequence} number:"
  gets.chomp.to_i
end

list = []

list << user_number("1st")
list << user_number("2nd")
list << user_number("3rd")
list << user_number("4th")
list << user_number("5th")

last_number = user_number("last")

if list.include?(last_number)
  puts "The number #{last_number} appears in #{list}."
else
  puts "The number #{last_number} does not appear in #{list}."
end
