array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
# the first loop copies a bunch of references
# the second loop destructively modifies the references in the first array, which affects the second
# avoid destructively modifying by reassigning to other variables or by using non-destructive methods
