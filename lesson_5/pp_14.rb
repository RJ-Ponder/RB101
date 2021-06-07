# Given this data structure write some code to return an array containing the 
# colors of the fruits and the sizes of the vegetables. The sizes should be 
# uppercase and the colors should be capitalized.
# The return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

description = [] # book solution uses map since it returns an array
hsh.each_value do |hash|
  if hash[:type] == 'fruit'
    description << hash[:colors].map { |word| word.capitalize }
  else
    description << hash[:size].upcase
  end
end

p description

# using map like the book:
new = hsh.map do |_, hash|
  if hash[:type] == 'fruit'
    hash[:colors].map { |word| word.capitalize }
  elsif hash[:type] == 'vegetable'
    hash[:size].upcase
  end
end

p new

# the difference is that a new array is returned because of Enumerable#map
# map on a hash works by transforming each key/value pair into whatever the block
# returns. It can't return another hash, so it returns it in an array with the same
# number of elements as key/value pairs in the original hash.
