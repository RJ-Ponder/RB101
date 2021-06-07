# A UUID is a type of identifier often used as a way to uniquely identify 
# items...which may not all be created by the same system. That is, without any 
# form of synchronization, two or more separate computer systems can create new 
# items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible 
# UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 
# 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.

def uuid
  hexadecimal = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  eight = ""
  8.times { eight << hexadecimal.sample }
  four_1 = ""
  4.times { four_1 << hexadecimal.sample }
  four_2 = ""
  4.times { four_2 << hexadecimal.sample }
  four_3 = ""
  4.times { four_3 << hexadecimal.sample }
  twelve = ""
  12.times { twelve << hexadecimal.sample }
"#{eight}-#{four_1}-#{four_2}-#{four_3}-#{twelve}"
end

p uuid

# Another solution:
def uuid2
  hexadecimal = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  uuid = ""
  32.times{ uuid << hexadecimal.sample }
  
  uuid.insert(8, '-')
  uuid.insert(13, '-')
  uuid.insert(18, '-')
  uuid.insert(23, '-')
end

p uuid2

# the book solution basically did what I did, but more iteratively. My version
# is a little more manual with combining sections in the first solution or inserting
# '-' in the second solution.
# Reproducing the book solution for the most part:
def uuid3
  hexadecimal = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  sections = [8, 4, 4, 4, 12]
  uuid = ""
  sections.each_with_index do |number, index|
    number.times {uuid << hexadecimal.sample }
    uuid << '-' unless index >= sections.length - 1
  end
  uuid
end

p uuid3

# Note, as indicated in the solution, #sample isn't the best way to generate a 
# random hexadecimal. You can look into SecureRandom#uuid in the standard library
# if you want "RFC 4122-compliant implementation of the algorithm"
