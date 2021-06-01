def reverse!(list)
  copy_list = list.dup
  counter = 0
  loop do
    break if counter >= list.length
    list[counter] = copy_list[-(counter + 1)]
    counter += 1
  end
list
end
# array[left_index], array[right_index] = array[right_index], array[left_index]
# book solution used parallel assignment, a Ruby idiom for exchanging two values
# without requiring an intermediate variable. It's a handy idiom to remember.

# Note that this method has a side effect (mutation) and a meaningful return value
# (the original array). Usually you want you methods to have one or the other, not both
list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true