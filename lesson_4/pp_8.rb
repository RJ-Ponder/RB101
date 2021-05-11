# how does take work? is it destructive?
# From the documents we can see that it returns the first n element from enum
# it is not destructive because the signature shows it returns a new array
# this is also verified in irb

arr = [1, 2, 3, 4, 5]
arr.take(2)