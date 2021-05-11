flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# turn the above into a hash where the names are the keys and the values are the positions in the array.

# first example { "Fred" => 0 }

# Initial thoughts: each with index will allow you to iterate with index

hash = {}

flintstones.each_with_index do |element, index|
  hash[element] = index
end

p hash

# turns out the example for each_with_index was exactly this problem
# note that the block can access the initialzed hash (outer scoped variable)
# not to be confused with methods that cannot access outer scoped variables except when 
# passed in as an argument