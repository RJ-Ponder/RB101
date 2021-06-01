# Based on the implementation of the method below, I think it will be a different
# object.
# Split returns an array. It is true that reverse! Mutates the array, however, it does
# not affect the original argument, which was a string.
# When join is called on the array, it is a new string object, not the original argument.

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"