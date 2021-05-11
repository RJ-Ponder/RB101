# What is the return value of the following statement? Why?

# ['ant', 'bear', 'caterpillar'].pop.size

# before checking docs, I think pop removes and returns the last element in the array
# then size returns the number of elements in the return value of pop, which is 1

['ant', 'bear', 'caterpillar'].pop.size

# I tested too early without reading the documentation properly.
# I assumed it would remove and return the element in an array
# But pop removes and returns the trailing element as it is
# In this case, it will be a string, and size will be called on the string, 'caterpillar'
# So size is called on a string and returns the number of characters in the string, 11

# also note that pop is destructive
