# Problem
  # Write a method that takes a string with one or more space separated words 
  # and returns a hash that shows the number of words of different sizes.
# Examples / Test Cases
  # word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
  # word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
  # word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
  # word_sizes('') == {}
# Data Structures
  # Input: string
  # Output: hash
# Algorithm
  # Words are delimited by spaces
  # non alphanumeric characters are considered part of the word if no space
  # put all words into an array
  # go through each word in the array and find the length
  # add these lengths to an array
  # create an array with only the unique values
  # iterate through the unique array to count the number of values in the length
  # array
  # assign the unique array value to the count in a hash
# Code with intent

def word_sizes(string)
  words = string.split(' ')
  lengths = []
  words.each { |word| lengths << word.length }
  unique_lengths = lengths.uniq
  length_frequency = {}
  
  unique_lengths.each do |item|
    length_frequency[item] = lengths.count(item)
  end
  length_frequency
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# From the book solution, I could have initialized a hash with the given default value of 0,
# so that whenever the first time a key is referenced, it will add 1 to 0 and not give an error message of nil.
# then any other time the value comes up again, 1 more is added.
# Rewriting it below:

def word_sizes2(string)
  frequency = Hash.new(0) #set the default value to 0
  string.split.each do |word| 
    frequency[word.length] += 1
  end
  frequency
end

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes2("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes2('') == {}
