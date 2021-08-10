=begin
Write a method that computes the difference between the square of the sum of the 
first n positive integers and the sum of the squares of the first n positive integers.

Problem
- find the difference between the square of sum and sum of squares
- the numbers are from 1 to the given number, inclusive
Data structure
- input: integer
- output: integer
Algorithm
- 1.upto(given) this is to iterate
- for the square of sums, could also use (1..given).to_a.sum or reduce
- for sum of squares, (1..given).to_a.map { |ea| ea ** 2 }.sum or reduce
=end

def sum_square_difference(integer)
  sum_square = (1..integer).to_a.sum ** 2
  square_sum = (1..integer).to_a.map { |num| num ** 2 }.sum
  sum_square - square_sum
end

# ALTERNATIVE WAY
# def sum_square_difference(integer)
#   sum_square = (1..integer).to_a.reduce(:+)**2
#   # or (1..integer).to_a.reduce{ |sum, num| sum + num } ** 2
#   square_sum = (1..integer).to_a.map { |num| num ** 2 }.reduce(:+)
#   sum_square - square_sum
# end

# ALTERNATIVE WAY
# def sum_square_difference(integer)
#   sum_square = 0
#   1.upto(integer) { |num| sum_square += num }
#   sum_square **= 2
  
#   square_sum = 0
#   1.upto(integer) { |num| square_sum += num ** 2 }
  
#   sum_square - square_sum
# end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
  # -> (1 + 2 + 3 + 4 + ... 10)**2 - (1**2 + 2**2 + 3**2 + 4**2...10**2)
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150