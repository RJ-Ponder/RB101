# Write a method that displays a 4-pointed diamond in an n x n grid, where n is 
# an odd integer that is supplied as an argument to the method. You may assume 
# that the argument will always be an odd integer.

# Rules
  # n determines the number of lines and columns
  # Diamonds (d) in each line, num, is (num + (num - 1)) up to (n / 2 + 1)
  # Then the second half is mirrored, reversed
  # spaces before and after the diamond are (n - d) / 2
# Algorithm 
  # Create a diamond hash with the number of diamonds in each line up to the halfway point
  # Create a spaces hash with the number of spaces in each line before each diamond
  # puts it all out in the correct format and mirror it
  # 1    *  
  # 2   *** 
  # 3  *****
  # 4   ***
  # 5    *

def diamond(n) # where n is an odd integer
  halfway = n / 2 + 1
  diamonds = {}
  spaces = {}
  # Using math to build number of diamonds and spaces for half the lines
  1.upto(halfway) do |num|
    diamonds[num] = 2*num - 1
    spaces[num] = (n - (2*num - 1)) / 2
  end
  # Displaying the top half of the diamond, including the center line
  1.upto(halfway) do |num|
    puts "#{' ' * spaces[num]}#{"*" * diamonds[num]}#{' ' * spaces[num]}"
  end
  # Displaying the bottom half of the diamond, excluding the center line
  (halfway - 1).downto(1) do |num|
    puts "#{' ' * spaces[num]}#{"*" * diamonds[num]}#{' ' * spaces[num]}"
  end
end

#diamond(9)

# The book solution logic was pretty similar to mine, except they used two methods, one
# to iterate through all the rows, and one to print what should be on each row
# One thing I could have done to simplify a lot is use #center(grid_size) rather
# than calculate the needed spaces.
# Refactoring:
def diamond2(n) # where n is an odd integer
  halfway = n / 2 + 1
  diamonds = {}
  # Using math to build number of diamonds and spaces for half the lines
  1.upto(halfway) do |num|
    diamonds[num] = 2*num - 1
  end
  # Displaying the top half of the diamond, including the center line
  1.upto(halfway) do |num|
    puts "#{("*" * diamonds[num]).center(n)}"
  end
  # Displaying the bottom half of the diamond, excluding the center line
  (halfway - 1).downto(1) do |num|
    puts "#{("*" * diamonds[num]).center(n)}"
  end
end

#diamond2(5)

# Further Exploration:
# Print only the outline of the diamond

def diamond_outline(n) # where n is an odd integer
  halfway = n / 2 + 1
  inner_spaces = {}
  # Using math to build number of inner spaces for half the lines
  1.upto(halfway) do |num|
    inner_spaces[num] = 2 * num - 3
  end
  # Displaying the top half of the diamond, including the center line
  1.upto(halfway) do |num|
    if num == 1
      puts "*".center(n)
    else
      puts "*#{' ' * inner_spaces[num]}*".center(n)
    end
  end
  # Displaying the bottom half of the diamond, excluding the center line
  (halfway - 1).downto(1) do |num|
    if num == 1
      puts "*".center(n)
    else
      puts "*#{' ' * inner_spaces[num]}*".center(n)
    end
  end
end

diamond_outline(5)
diamond_outline(11)
diamond_outline(13)
