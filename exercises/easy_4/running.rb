=begin
Problem
  Write a method that takes an array of numbers,
  and returns an array with the same number of elements,
  and each element has the running total from the original array
Examples / Test Cases
  running_total([2, 5, 13]) == [2, 7, 20]
  running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
  running_total([3]) == [3]
  running_total([]) == []
Data Structures
  input array, output array
Algorithm
  Can I do this recursively, with a loop, or with a succint method?
  Loop might be the easiest for me now
  Each index in the new array is the sum of the previous indexes' values
=end
=begin
def running_total(array)
  counter = 0
  summed_array = [array[counter]]
  
  while counter < array.length - 1
    summed_array << (summed_array[counter] + array[counter + 1])
    counter += 1
  end
  
  summed_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == [] # this is not accounted for, try another way using map or each or each with object or inject

def running_total(array)
  sum = 0
  array.map { |element| sum += element }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == [] # with the above method, the blank array is accounted for.

# Further Exploration (Enumerable #each_with_object)
def running_total(array)
  sum = 0
  array.each_with_object([]) { |element, object| object << sum += element }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
=end
def running_total(array)
  running_array = []
  
  array.reduce(0) do |running_total, element|
  
  running_array << (running_total + element)
  running_total + element # why can't you put this line on the same line as above? Or put this line before the above line? As far as I can tell, this line triggers the next iteration.
  end

  running_array
end

p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []


=begin
def running_total(array)

  running_total_array = []

  array.reduce(0) { |x, n|
    running_total_array << (x + n)
    x + n
  }

  running_total_array
end

p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []
=end