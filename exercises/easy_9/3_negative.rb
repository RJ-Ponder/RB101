def negative1(num)
  if num > 0
    -1 * num
  else
    num
  end
end

# ternary way
def negative2(num)
  num > 0 ? -num : num
end

# shorter way
def negative3(number)
  -number.abs
end

p negative1(5) == -5
p negative1(-3) == -3
p negative1(0) == 0      # There's no such thing as -0 in ruby

p negative2(5) == -5
p negative2(-3) == -3
p negative2(0) == 0  

p negative3(5) == -5
p negative3(-3) == -3
p negative3(0) == 0  
