# Given this data structure write some code to return an array which contains 
# only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new = arr.select do |sub_hash|
    sub_hash.values.flatten.all? { |num| num.even? }
end

p new

# I didn't think of using enumerable#all? on a hash. The implementation of enumerable 
# methods on hashes seem to be that you can have key and value parameters passed into
# the block. Therefore, you could call all? on the hash to determine if all the 
# values contain only even numbers. I got stuck with thinking only each allowed you 
# to iterate through the keys or values, but the return value isn't helpful. 
# Really, many of the methods in enumerable as well, allow you to use keys and values
# as parameters in the block.

newer = arr.select do |sub_hash|
  sub_hash.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end

p newer
