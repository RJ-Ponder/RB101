=begin
String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.

The code doesn't work because upcase! is called on the individual elements, not the collection object as a whole. 
=end

def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# The easiest way to fix this is:
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you')

# or, non-destructive
def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you')