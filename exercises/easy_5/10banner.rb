# Write a method that will take a short line of text, and print it within a box.
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# Rules
  # The corners of the box are "+"
  # The bottom and top of the box are "-" equal to the length of the string + 2
  # The sides of the box are "|" using three lines
  # The box total will use 5 lines and the text will be on the third line 

# putting "a" in a box will look like this on one line:
# puts "+---+\n|   |\n| a |\n|   |\n+---+"
  # Order:
  # +
  # - (length + 2)
  # +\n|
  # ' ' (length + 2)
  # |\n|' 'string' '|\n|
  # ' ' (length + 2)
  # |\n+
  # - (length + 2)
  # +
# create line by line
  # Line 1: + length + 2 +
  # Line 2: | length + 2 |
  # Line 3: |   string   |
  # Line 4: | length + 2 |
  # Line 5: + length + 2 +

  # Need to create an algorithm that matches the rules to return the above
  # Create a loop based on the length of the string
  # add to an empty array +, - x length + 2, +, \, n, |, etc.
  # then join and puts

# def print_in_box(string)
#   width = string.length + 2
  
#   dashes = ""
#   spaces = ""
  
#   width.times { dashes << "-" } # I forgot until looking at the solution that I could use the * method for strings to repeat
#   width.times { spaces << " " }
  
#   puts "+" + dashes + "+\n|" + spaces + "|\n| " + string + " |\n|" + spaces + "|\n+" + dashes + "+"
# end

# print_in_box("This is a test!")
# print_in_box(" +++ This is probably my favorite method I created so far +++ ")
# print_in_box('')
# print_in_box('To boldly go where no one has gone before.')

# # Refactoring based on solution

# def print_in_box2(string)
#   width = string.length + 2
#   line1 = "+" + ("-" * width) + "+"
#   line2 = "|" + (" " * width) + "|"
#   line3 = "| " + string + " |"
  
#   puts line1
#   puts line2
#   puts line3
#   puts line2
#   puts line1
  
# end

# print_in_box2("This is a test!")
# print_in_box2(" +++ This is probably my favorite method I created so far +++ ")
# print_in_box2('')
# print_in_box2('To boldly go where no one has gone before.')

# Further exploration:
  # 1) Truncate if longer than 80, including sides of box
    # add a simple if statement that when string.length is greater than 76, 
    # only show string[0, 76]
  # 2) Wrap to appear on multiple lines if longer than 80 lines
    # Write in conditionals for breaking the string into multiples of 76
    # Divmod string length by 76, parallel assign first index of array to number of puts
    # second index to number
    
def print_in_box_wrap(string)
  if string.length >= 76
    width = 78
  else
    width = string.length + 2
  end

  horizontal = "+" + ("-" * width) + "+"
  spaces = "|" + (" " * width) + "|"

  puts horizontal
  puts spaces
  
  min_lines, extra = string.length.divmod(76)
  
  if extra != 0
    additional = 1
  else
    additional = 0
  end
  
  lines = min_lines + additional
  
  line_counter = 1
  loop do
    break if line_counter > lines
    
    if line_counter == 1
      puts "| " + string[0, 76] + " |"
    elsif line_counter == lines
      puts "| " + string[-extra, extra] + (" " * (76 - extra)) + " |"
    else
      puts "| " + string[((line_counter - 1 ) * 76) + 1, 76] + " |"
    end
    line_counter += 1
  end
  
  puts spaces
  puts horizontal
end

# print_in_box_wrap("+++ Now I am testing the wrapping to see if this works. This is really cool if it does! This is probably my favorite method I created so far +++")
# print_in_box_wrap("01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789")
# print_in_box_wrap("Now this is a story all about how / My life got flipped turned upside down / And I'd like to take a minute, just sit right there / I'll tell you how I became the prince of a town called Bel-Air")

print_in_box_wrap("This is a test of the bannerizer")
print_in_box_wrap("Now this is a really long one to see how it wraps around and still displays correctly in the box")
