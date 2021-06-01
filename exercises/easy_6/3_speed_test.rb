require 'benchmark'
# puts Benchmark.measure {

# def find_fibonacci_index_by_length(number_of_digits)
#   first = 1
#   second = 1
#   sum = 0
#   counter = 3
  
#   loop do
#     sum = first + second
#     break if sum.digits.size >= number_of_digits
    
#     first = second
#     second = sum
#     counter += 1
#   end
  
#   counter
  
# end
# p find_fibonacci_index_by_length(2000) #== 4782
# }

# puts Benchmark.measure {

# def find_fibonacci_index_by_length(number_of_digits)
#   first = 1
#   second = 1
#   sum = 0
#   counter = 3
  
#   loop do
#     sum = first + second
#     break if sum.to_s.size >= number_of_digits
    
#     first = second
#     second = sum
#     counter += 1
#   end
  
#   counter
  
# end
# p find_fibonacci_index_by_length(2000) #== 4782
# }

puts Benchmark.measure { p 123456789012345678901234567890.to_s.size }
puts Benchmark.measure { p 123456789012345678901234567890.digits.size }