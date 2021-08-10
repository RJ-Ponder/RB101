# def multiply_list(arr_1, arr_2)
#   index = 0
#   multiplied = []
#   loop do
#     multiplied << (arr_1[index] * arr_2[index])
#     index += 1
#     break if index > arr_1.length - 1
#   end
#   multiplied
# end

# refactored with iterative method instead of loop
def multiply_list(arr_1, arr_2)
  multiplied = []
  arr_1.each_with_index do |item, index|
    multiplied << (item * arr_2[index])
  end
  multiplied
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further exploration:
  # use #zip to come up with a one line solution

def multiply_list2(arr_1, arr_2)
 arr_1.zip(arr_2).map { |sub_array| sub_array.reduce(1, :*) }
end

p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
