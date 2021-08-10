def penultimate(string)
  string.split[-2]
end


p penultimate('last word') #== 'last'
p penultimate('Launch School is great!') #== 'is'
p penultimate('test')

# Further Exploration
  # Our solution ignored a couple of edge cases because we explicitly stated that 
  # you didn't have to handle them: strings that contain just one word, and 
  # strings that contain no words.

  # Suppose we need a method that retrieves the middle word of a phrase/sentence. 
  # What edge cases need to be considered? How would you handle those edge cases 
  # without ignoring them? Write a method that returns the middle word of a phrase 
  # or sentence. It should handle all of the edge cases you thought of.
  
# edge case of even number of words, one word, no word; use conditionals
# F.E. not attempted at this time
