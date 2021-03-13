=begin
Problem
Write a method that counts the number of occurences of each element in a given array.
Once counted, print each element alongside the number of occurences.

Examples/Test Case
The words in the array are case-sensitive: 'suv' != 'SUV'.
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

car => 4
truck => 3
SUV => 1
motorcycle => 2

Data Structure
You may assume the argument is an array of strings.
Output either a nested array or a hash that pairs the element with the number of occurences.

Algorithm
Brute force:
  Use the uniq method to get an array of only unique values.
  Iterate through the unique array, using each element as an argument with the count method to determine the number of occurences.
  Save that number in a hash with the value.
  Print out the value and number of occurrences in the hash.
=end

def count_occurrences(array)
  unique_array = array.uniq
  
  index = 0
  occurences_hash = {}
  
  # rather than using a loop, the book solution more elegantly uses each and doesn't unnecessarily assign arrays to new variables.
  # writing from memory: 
  # array.uniq.each { |element| occurences_hash[element] = array.count(element) }
  
  loop do
    break if index == unique_array.length
    occurences_hash[unique_array[index]] = array.count(unique_array[index])
    index += 1
  end
  
  occurences_hash.each { |string, occurences| puts "#{string} => #{occurences}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

my_test = %w(one two two three three three four four four four ONE)

count_occurrences(vehicles)
count_occurrences(my_test)

# further exploration: first downcase every element in the array