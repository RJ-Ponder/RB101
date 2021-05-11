# we can find out what shift does by checking the documenation
# "Removes the first hash entry; returns a 2-element Array containing the removed key and value"

# Based on this, the below will return [:a, 'ant']; also hash will be mutated with the first
# key value pair removed.

hash = { a: 'ant', b: 'bear' }
hash.shift
