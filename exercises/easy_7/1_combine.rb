def interleave(arr_1, arr_2)
  interleaved_array = []
  counter = 0
  loop do
    break if counter > (arr_1.length - 1)
    interleaved_array << arr_1[counter]
    interleaved_array << arr_2[counter]
    counter += 1
  end
  interleaved_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# zip does something very similar. See if you can rewrite this using zip.

def zipped(arr_1, arr_2)
  arr_1.zip(arr_2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
