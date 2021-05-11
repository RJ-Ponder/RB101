# write a method that doubles numbers and returns the original array mutated

def double_numbers!(number_array)
  counter = 0
  
  loop do
    break if counter == number_array.size
    number_array[counter] = (number_array[counter] * 2) # could also be written number_array[counter] *= 2
    
    counter += 1
  end
  number_array
end

numbers = [1, 4, 3, 7, 2, 6]

p "Before: #{numbers}"

p double_numbers!(numbers)

p "After: #{numbers}"