=begin
Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested sub-arrays:

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

Use the merge method you wrote previously
Essentially you should call the merge method many times; eventually each array will be "sorted" (only contain one element).
Then the arrays need to be joined together two at a time

Algorithm
[9, 5, 7, 1] -> original array
[[9, 5], [7, 1]] -> 
[[[9], [5]], [[7], [1]]]

=end
# require 'pry'
def merge(array1, array2)
  index1 = 0
  index2 = 0
  result = []
  loop do
    if index1 >= array1.size && index2 >= array2.size
      break
    elsif index1 >= array1.size
      result << array2[index2]
      index2 += 1
    elsif index2 >= array2.size
      result << array1[index1]
      index1 += 1
    elsif array1[index1] <= array2[index2]
      result << array1[index1]
      index1 += 1
    else
      result << array2[index2]
      index2 += 1
    end
  end
  result
end

# p merge([3, 5, 7], [4, 8, 9]) # => [3, 4, 5, 7, 8, 9]


# # procedure mergesort( var a as array )
# #   if ( n == 1 ) return a

# #   var l1 as array = a[0] ... a[n/2]
# #   var l2 as array = a[n/2+1] ... a[n]

# #   l1 = mergesort( l1 )
# #   l2 = mergesort( l2 )

# #   return merge( l1, l2 )
# # end procedure

def merge_sort(array)
  return array if array.size == 1
  a = array[0...(array.size / 2)]
  b = array[(array.size / 2)...array.size]

  a = merge_sort(a)
  b = merge_sort(b)
  
  return merge(a, b)
end

# merge_sort(Array.new(1_000_000) { rand(1..100_000_000)})
# p merge_sort([3, 5, 1, 6, 2, 4])
# p merge_sort([9, 5, 7, 1]) #== [1, 5, 7, 9]
# p merge_sort([5, 3]) #== [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

=begin
Further Exploration
Every recursive algorithm can be reworked as a non-recursive algorithm. Can you write a method that performs a non-recursive merge sort?
=end

# My solution
def merge_sort_loop(array)
  nested = array.map { |element| [element] }
  sorted = []
  loop do
    loop do
      if nested.size == 1
        sorted << nested.pop
      elsif nested.size < 1
        break
      else
        sorted << merge(nested.shift, nested.pop)
      end
    end
    nested = sorted
    break if sorted.size == 1
    sorted = []
  end
  sorted[0]
end

# Simpler solution from Ricky Viejo making use of the result array in merge, but way less efficient.
# In my opinion, doesn't really have the essence of the merge sort algorithm because there is no divide and conquer.
# def merge_sort_loop(ary)
#   result = []
#   ary.each do |elt|
#     result = merge(result, [elt])
#   end
#   result
# end

# Another solution variation similar to mine that is efficient from Eisenchteter Alexandre
def merge_sort_loop(array)
  output = Array.new(array.size) {|i| [array[i]] }

  until output.size == 1
    output = output.each_slice(2).with_object([]) do |slice, result|
      result << (slice[1].nil? ? slice[0] : merge(slice[0], slice[1]))
    end
  end

  output[0]
end

# p merge_sort_loop([4, 2, 3, 1, 5])
# p merge_sort_loop([3, 5, 1, 6, 2, 4])
# p merge_sort_loop([9, 5, 7, 1]) #== [1, 5, 7, 9]
# p merge_sort_loop([5, 3]) #== [3, 5]
# p merge_sort_loop([6, 2, 7, 1, 4]) #== [1, 2, 4, 6, 7]
# p merge_sort_loop(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort_loop([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) #== [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
# p merge_sort_loop([10, 2, 12, 1, 3, 13, 15, 14, 8, 11, 6, 5, 7, 9, 4])
merge_sort_loop(Array.new(1_000_000) { rand(1..100_000_000)})