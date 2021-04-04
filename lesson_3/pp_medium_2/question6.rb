def color_valid(color)
  color == "blue" || color == "green" # (if you didn't have the second 'color ==' the return will be "green")
end

p color_valid('purple')