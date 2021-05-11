# write a method that allows you to multiply every array item by a specified value

def multiply(numbers_array, factor)
  multiplied_numbers = []
  
  counter = 0
  
  loop do
    break if counter == numbers_array.size
    
    current_number = numbers_array[counter]
    multiplied_numbers << current_number * factor
    
    counter += 1
  end
  
  multiplied_numbers
  
end

my_numbers = [1, 2, 3, 4, 5]

p multiply(my_numbers, 2)
p multiply(my_numbers, 3)
p multiply(my_numbers, 4)