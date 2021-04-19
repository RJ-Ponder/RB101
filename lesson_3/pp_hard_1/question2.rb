# What is the result of the last line in the code below?
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# My first thought is that informal_greeting points to the object in the hash
# Since the object in the hash is mutated by <<, the result should be { a: 'hi there' }