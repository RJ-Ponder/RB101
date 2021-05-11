# PP 1
# The return value of the select method will be [1, 2, 3]
# because the return value of the block will always be truthy

[1, 2, 3].select do |num|
  num > 5
  'hi'
end