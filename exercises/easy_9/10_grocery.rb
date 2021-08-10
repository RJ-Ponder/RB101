def buy_fruit(nested_array)
  list = []
  nested_array.each do |array|
    array[1].times { list << array[0] }
  end
  list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Note that we could use the block parameters to access each element of the subarrays, like this:
  # list.each do |fruit, quantity|
  #   quantity.times { expanded_list << fruit }
  # end

# My solution was the same as the book's first solution.
# The book's second solution was something I had in mind for a second, using
# map and then flatten
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten # block parameters access each element of the subarrays
end

# fruit is in an array ([fruit]) for array concatenation
# each element in the original array is replaced with an array of the number of 
# fruit specified. The flatten method removes the nesting
