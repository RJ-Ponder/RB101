=begin
Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

This doesn't work because in the decrease method, counter is reassigned to a new value, the number that is printed on the screen displays the same object that counter points to when initialized. 
=end

# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   decrease(counter)
# end

# puts 'LAUNCH!'

# There are many ways to fix this:

# 1) use something that can be mutated
def decrease(counter)
  counter[0] -= 1
end

counter = [10]

10.times do
  puts counter[0]
  decrease(counter)
end

puts 'LAUNCH!'

# 2) get rid of the method
counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'

# 3) get rid of the method and use a block parameter
counter = 10

10.times do |count|
  puts counter - count
end

puts 'LAUNCH!'

# 4) reassign the counter variable to the return of the method
def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# 5) specify '10' only once
def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'