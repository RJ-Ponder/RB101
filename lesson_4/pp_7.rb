# the block's return value is a boolean, true or false
# the return value of the method, any? is the boolean true
# because there is an element that makes the block return true (1 and 3 in this case)

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# It is interesting to note that the any function will stop iterating after the first element
# because the true condition is satisfied to let it know what to return (similar to OR operator ||)
# This is seen when running the code as puts num is only evaluated for the first item in the array.