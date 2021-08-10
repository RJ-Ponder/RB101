def uppercase?(string)
  all_upper = true
  string.each_char do |char|
    all_upper = false if char != char.upcase
  end
  all_upper
end

# After seeing book solution, I didn't realize that the #upcase method already
# converts all the characters in a string into uppercase. So I could just compare
# the original string with an upcase string to see if it's true or not

def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration:
# The empty string returning true is just a default. Kind of like how 0 is not
# negative and defaults to positive. You could say that an empty string, or string without 
# alpha characters in general defaults to false because there are no characters
# to upcase, but this would just be a default, arbitrary assignment. 

# It makes more sense to me to keep it default to true, because the purpose of this method
# seems to me to be to flag if you have a string with alpha characters that are
# lowercase. If there are no lowercase characters at all there shouldn't be a flag of false.
