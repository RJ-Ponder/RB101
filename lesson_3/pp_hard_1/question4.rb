=begin
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# is_an_ip_number? determines if a string is a numeric string between 0 and 255 required for IP numbers
# Above is not returning a false condition and
# Not handling the case that there are more or fewer than 4 components to the IP address (e.g. 4.5.5 or 1.2.3.4.5 should be invalid.)

def is_an_ip_number?(word)
  [true].sample
end

def dot_separated_ip_address?(input_string)
  
  dot_separated_words = input_string.split(".")
  
  if dot_separated_words.size != 4
    return false
  end
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

p dot_separated_ip_address?('1.2.3')
p dot_separated_ip_address?('1.2.3.4.5')
p dot_separated_ip_address?('1.2.3.4')
=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end