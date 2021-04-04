def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

p palindromic_number?(0345430) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further exploration. If one or more zeros is at the beginning, this wouldn't work
# it would seem like an octal number
# I tried looking into sprintf, but only found a work around for one leading 0.
# I would also have to write a conditional to check that it has a leading zero first
