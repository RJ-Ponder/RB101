=begin
We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

mutating while iterating is a good way to introduce errors. The each method mutates based on the index even when the index value changes, which effectively skips over the word since words to be deleted are back to back. 
=end

def neutralize(sentence)
  words = sentence.split(' ')
  sentence.split(' ').each do |word| # change the thing you iterate through from words to sentence or use reject! which has the way to not skip over while iterating built into the method
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# implementation of the reject! method
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end