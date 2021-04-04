def oddities(array)
  array.select { |element| array.index(element).even? }
end
# note that the destructive method select! doesn't work because returns nil if no elements removed.
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# a while loop with index also works
# another possible way is with each_index