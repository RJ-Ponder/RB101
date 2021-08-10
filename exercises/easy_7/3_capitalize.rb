def word_cap(string)
  arr = string.split
  arr.each do |word| # could have used map to save a saving variable step
    word.capitalize! # and in that case, this could be non-destructive
  end
  arr.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# idomatically:
def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end
# In the second solution, (&:method_name) is shorthand notation for 
# { |item| item.method_name }. Thus, &:capitalize translates to:
# do |word|
#   word.capitalize
# end
# We can use this shorthand syntax with any method that has no required arguments.

# Further Exploration
  # Ruby conveniently provides the String#capitalize method to capitalize strings. 
  # Without that method, how would you solve this problem? Try to come up with at least two solutions.
# F.E. not attempted at this time
