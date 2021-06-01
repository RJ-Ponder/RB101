# Working on my own solution to the palindrome problem
# Need to find all possible substrings in a given string and return them in
# an array

# Test case:
# substrings('halo') == ["ha", "hal", "halo", "al", "alo", "lo"] # => true

# Rules:
  # At each index position, iterate to each next position until the end
  # Go to the next index position

def substrings(string)
substring_array = []
string_length = string.length

starting_index = 0

loop do
  substring_length = 2
  break if starting_index > (string_length - 1)
    loop do
      break if (substring_length + starting_index) > string_length
      substring_array << string[starting_index, substring_length]
      substring_length += 1
    end
  starting_index += 1
end

substring_array

end
# I created the above thinking through it on my own, logically, which almost exactly mirrors the book solution.

#p substrings('halo') == ["ha", "hal", "halo", "al", "alo", "lo"]
#p substrings('this is a more complex test')

def palindromes(string)
  substring_array = substrings(string)
  substring_array.select { |word| word.reverse == word }
end

p palindromes("halo")
p palindromes("this is a more complex test haha racecar")
p palindromes("find every palindrome substring in this sentence and you win an award")
