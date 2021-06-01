def find_fibonacci_index_by_length(number_of_digits)
  first = 1
  second = 1
  sum = 0
  counter = 3

  loop do
    sum = first + second
    break counter if sum.to_s.size >= number_of_digits

    first = second
    second = sum
    counter += 1
  end
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
# p find_fibonacci_index_by_length(1000) #== 4782
# p find_fibonacci_index_by_length(10000) #== 47847

# Somehow I lost all the notes I took on this problem, but thankfully I posted about
# it under user submitted solutions. The gist is that I originally had sum.digits.size
# on line 9 which is a lot slower.

# Also, I spend some time to create the Fibonacci sequence using recursion:
def fibonacci(n)
  return n if n < 2
  fibonacci(n - 2) + fibonacci(n - 1)
end

p fibonacci(7) # => 13
p fibonacci(12) # => 144

# The key points:
# Iteration is usually faster and easier to think about, but it is good to learn how to think recursively
# Iteration builds to solve the problem
# Recursion reduces to solve the problem in the simplest form (base case) to exit and calls itself to start the decision tree
# Recursion builds on the stack and can't exceed the stack limit

# Finally, an interesting and smart way to do the Fibonacci
def fibonacci_other(n)
  fib = [1, 1]
  counter = 0
  loop do
    break if counter > n - 3
    fib << (fib[-2] + fib[-1])
    counter += 1
  end
  fib
end

p fibonacci_other(7)
p fibonacci_other(12)