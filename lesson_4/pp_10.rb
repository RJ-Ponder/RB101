# this one is interesting, but after the last problem I'm more equipped
# the if condition will evaluate true for the first condition when num > 1
# but puts returns a nil and that gets mapped
# when the first condition isn't fulfilled, the second condition is executed and
# returns the element

# this example will return an array [1, nil, nil]

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
