def sequence(num)
  (1..num).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Further Exploration:
# If 0 I want to display zero. If a negative number, I want to display negatives
# up to -1
def sequence2(num)
  if num == 0
    [num]
  elsif num > 0
    (1..num).to_a
  else
    (1..-num).to_a.map { |n| -n }.reverse
  end
end

p sequence2(-5)
p sequence2(-1)
p sequence2(0)
p sequence2(1)
p sequence2(5)
