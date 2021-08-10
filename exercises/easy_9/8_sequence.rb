def sequence(count, start)
  seq = []
  count.times { |num| seq << start * (num + 1) }
  seq
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) #== [0, 0, 0]
p sequence(0, 1000000) #== []

# book solution uses times in a different way, pushing the start value to the sequence
# array and then accumulating the start value with the next one
def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

# Their second solution uses map
def sequence(count, first)
  (1..count).map { |value| value * first }
end
