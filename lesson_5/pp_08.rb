# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |word|
    word.each_char { |char| puts char if char.match?(/[aeiou]/i) }
  end
end

# similar to book, except they converted each word into an array of characters
# using #chars, and then used #each (as opposed to #each_char directly)
# also, they checked if the variable vowels = 'aeiou' included the given character,
# vowels.include?(char)