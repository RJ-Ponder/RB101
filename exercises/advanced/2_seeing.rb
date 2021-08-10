=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd 
integer that is supplied as an argument to the method. The smallest such star 
you need to handle is a 7x7 grid.

Rules
- the grid will be n x n, smallest is 7
- the first n/2 lines mirror the last n/2 lines
- the middle line has n stars in a row
- all other lines have 3 stars in a row with n - 3 spaces
- Star placement from line 1 upto n/2, where L is line number
- space(L-1) * space(n-3/2) * space(n-3/2) * space(L-1)

=end

def star(n)
  0.upto((n / 2) - 1) do |line|
    ends = " " * line
    middle = " " * ((n - 3 - (line * 2)) / 2)
    puts "#{ends}*#{middle}*#{middle}*#{ends}"
  end
  
  puts "*" * n
  
  ((n / 2) - 1).downto(0) do |line|
    ends = " " * line
    middle = " " * ((n - 3 - (line * 2)) / 2)
    puts "#{ends}*#{middle}*#{middle}*#{ends}"
  end
end

star(7)
=begin
*  *  *
 * * *
  ***  
*******
  ***  
 * * * 
*  *  *
=end

puts

star(9)
=begin
*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
=end

=begin
Further Exploration
What other patterns can you come up with that can be produced in similar ways 
to the patterns of this exercise? Can you draw a reasonable looking circle? 
How about a sine wave?
    *  * 
 *        *
*          *
*          *
 *        *
    *  *

  *  *
*      *
*      *
  *  *

************
*          *
*          *
*          *
*          *
************
=end