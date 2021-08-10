require 'pry'

def all_substrings(string)
  substrings = []
  counter = 0
  loop do
    for num in 1..(string.length - counter)
      substrings << string[counter, num]
    end
  counter += 1
  break if counter >= string.length
  end
  substrings
end

# Solution where I call the previously made method:

def leading_substrings(string)
  substrings = []
  for num in 1..string.length
    substrings << string[0, num]
  end
  substrings
end

def all_substrings2(string)
  substrings = []
  for num in 0..(string.length - 1)
    substrings += leading_substrings(string[num..])
  end
  substrings
end

p all_substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

p all_substrings2('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
