# based on the documentation the return value of map is an
# array with the results of running the block for every element in the enumerable
# in this example, the hash is iterated through twice
# value is returned once for 'bear' since it is greater than 3 characters
# the return value of the method should be an array ['bear']

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# After running in irb I should have realized that map transforms EVERY element
# so in the case where the if condition is not true, nil is returned and that is what gets mapped
# map always returns an array with the same number of element (or in this case pairs, values) as the original enumerable