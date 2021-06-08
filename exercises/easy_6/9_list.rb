def include?(array, element)
  included_array = []
  array.each { |item| included_array << item if item == element }
  !(included_array.empty?)
end

p include?([1,2,3,4,5], 3) #== true
p include?([1,2,3,4,5], 6) #== false
p include?([], 3) #== false
p include?([nil], nil) #== true
p include?([], nil) #== false

# book solution said return true if value == element, ended with false in the case
# that value != element

# easy solution:
def include?(array, value)
  !!array.find_index(value)
end
