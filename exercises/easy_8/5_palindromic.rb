def leading_substrings(string)
  substrings = []
  for num in 1..string.length
    substrings << string[0, num]
  end
  substrings
end

def all_substrings(string)
  all_substrings = []
  for num in 0..(string.length - 1)
    all_substrings += leading_substrings(string[num..])
  end
  all_substrings
end

def palindromes(string)
  all_substrings(string).select do |sub_string|
    sub_string.length >= 2 && sub_string.reverse == sub_string
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration
  # Can you modify this method (and/or its predecessors) to ignore 
  # non-alphanumeric characters and case? Alphanumeric characters are alphabetic 
  # characters(upper and lowercase) and digits.
# F.E. is not attempted at this time