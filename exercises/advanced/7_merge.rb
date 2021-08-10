=begin
Merge Sorted Lists
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

Problem
- merge the sorted arrays one element at a time so that the result array is also
  sorted
- you can not perform any kind of sort operation on the result array
- you should not mutate the input arrays
Examples
- [1, 5, 9], [2, 6, 8] => first, second, first, second, second, first
- [1, 1, 3], [2, 2] => first, first, second, second, first
- assume that the array will not contain nil
Data structure
- input: two arrays
- output: one array that is the combination of the two and sorted
Algorithm
- initialize and index1 and index2 (one for each array)
- start a loop
- compare the arrays at the given index value
- push the smaller value into the result array
- add the index count to the one you pushed
- when index is equal to the corresponding array length - 1 push the other element
=end

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

# p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) #== [1, 4, 5]
# p merge([1, 4, 5], []) #== [1, 4, 5]
p merge([9], [5])