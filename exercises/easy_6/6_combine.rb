def merge(arr_1, arr_2)
  merged_arr = []
  arr_1.each { |num| merged_arr << num unless merged_arr.include?(num) }
  arr_2.each { |num| merged_arr << num unless merged_arr.include?(num) }
  merged_arr
end

array1 = [1, 3, 5]
array2 = [3, 6, 9]
p merge(array1, array2)
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# the Ruby union method (Array#|) does exactly this:
def merge(array_1, array_2)
  array_1 | array_2
end