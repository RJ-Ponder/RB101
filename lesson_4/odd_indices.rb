# write a method that doubles integers of odd indices

def double_odd_indices(number_array)
  counter = 0
  
  doubled_array = []
  
  loop do
    break if counter == number_array.size
    
    if counter.odd?
      doubled_array << number_array[counter] *= 2 # book solution makes new variable current_number
    else                                          # if counter is odd, then current_number * 2
      doubled_array << number_array[counter]      # then current_number is always added to the doubled_array
    end
    
    counter += 1
  end
  
  doubled_array
end

numbers = [1, 4, 3, 7, 2, 6]

p double_odd_indices(numbers)