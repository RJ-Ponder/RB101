# Problem
  # Modify the word_sizes method from the previous exercise to exclude 
  # non-letters when determining word size. For instance, the length of "it's" 
  # is 3, not 4.
# Examples / Test Cases
  # word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
  # word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
  # word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
  # word_sizes('') == {}
# Data Structures
  # Input: String
  # Output: Hash
# Algorithm
  # Similar to the last one, but this time we need a way to exclude non-letters
  # Give a condition to the count method to only count letters

def word_sizes(string)
  frequency = Hash.new(0) # set the default value to 0
  string.split.each do |word| 
    frequency[word.count("a-zA-Z")] += 1
  end
  frequency
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
