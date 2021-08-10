# Given the array:
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
# Write a program that prints out groups of words that are anagrams. Anagrams 
# are words that have the same exact letters in them but in a different order. 
# Your output should look something like this:
  # ["demo", "dome", "mode"]
  # ["neon", "none"]
  # (etc)

# Algorithm
  # create a hash of keys with empty arrays as values
  # the keys are generated from 

def anagrams(array)
  hash = {}
  
  array.each do |word|
    anagram = word.chars.sort.join('')
    if hash.key?(anagram)
      hash[anagram] += [word]
    else
      hash[anagram] = [word]
    end
  end
  hash.values.each { |group| p group }
end

anagrams(words)
