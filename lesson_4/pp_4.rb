# each with object let's you designate the object that is returned
# by using it as an argument
# then the argument can be used in the block, for example, to push to an array
# In the example below, a hash is given as an argument for the method

# value[0] returns the first letter in each element
# hash[value[0]] = value assigns the first letter in each element as the key
# and each element as the value
# you should get a return of { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# note that each returns the original collection, whereas each_with_object
# returns the initially given object ( {} in this case) with all the updates from each iteration
