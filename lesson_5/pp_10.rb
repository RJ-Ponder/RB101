# Given the following data structure and without modifying the original array, 
# use the map method to return a new array identical in structure to the original 
# but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new = arr.map do |sub_hash|
  sub_hash.transform_values { |values| values += 1 }
end

p new
p arr

# I solved this by happening to find documentation for the map equivalent for hashes
# specifically for keys or values individually (transform...)
# This works because it returns a new hash.

# However, the book solved it in a way I knew how without that special method, I just
# didn't think of it. Reproducing it below without looking.

newer = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |sub_hash|
  new_hash = {}
  sub_hash.each do |key, value|
    new_hash[key] = value + 1
  end
  new_hash
end

p newer
