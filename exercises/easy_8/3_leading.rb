def leading_substrings(string)
  substrings = []
  for num in 1..string.length
    substrings << string[0, num]
  end
  substrings
end
  


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
