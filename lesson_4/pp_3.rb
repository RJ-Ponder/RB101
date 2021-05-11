# The documentation says reject returns an array of values for which
# the given block returns false
# puts will always return nil in the block, which is a falsey value
# Therefore, the block will always return falsey and the original array is returned.

# Think of reject as rejecting from the array anything that is true
# Since nothing was true, nothing was rejected
# If the return value was false or nil, the element would be selected
# If everything was true, everything would be rejected and you would have an empty array.

[1, 2, 3].reject do |num|
  puts num
end