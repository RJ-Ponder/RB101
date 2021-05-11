# Count treats the block's return value as a truthy or falsey value (considers the truthiness)
# The documentation says if a block is given, it counts the number of elements
# yielding a true value
# The result of the code should be 2

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end