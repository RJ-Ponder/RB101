def triangle(n)
  (1..n).each do |x|
    spaces = n - x
    stars = x
    puts " " * spaces + "*" * stars
  end
end

triangle(15)

# Further Exploration
  # Try modifying your solution so it prints the triangle upside down from its current orientation. 
  # Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.
  
# F.E. not attempted at this time