# Write a method that takes two Array arguments in which each Array contains a 
# list of numbers, and returns a new Array that contains the product of every 
# pair of numbers that can be formed between the elements of the two Arrays. 
# The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(arr_1, arr_2)
  arr_1.product(arr_2).map { |sub_array| sub_array.reduce(1, :*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Book solution was a little more iterative, iterating through the first array
# and multiplying every element by iterating through the second array

def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end
