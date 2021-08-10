def show_multiplicative_average(array)
  multiply = array.reduce(1, :*).to_f
  result = sprintf("%.3f", multiply/array.length)
  puts "The result is #{result}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# now just get the format correct with decimals