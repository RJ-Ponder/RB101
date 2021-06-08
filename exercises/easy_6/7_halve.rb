def halvsies(array)
  if array.length.odd?
    half = ((array.length / 2) + 1) 
  else
    half = array.length / 2
  end
  
  first_array = array[0, half]
  second_array = array[half, (array.length - half)]
  
  [first_array, second_array]
end

p halvsies([1, 2, 3, 4, 5, 6, 7, 8, 9])
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Further Exploration
  # Book solution removes the conditional and uses a #ceil call and the 
  # float 2.0 to get a 0.5 that rounds up for odd numbers
  # My solution after that was the same in logic.