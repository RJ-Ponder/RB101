# This time, I'm writing the Fibonacci sequence using iteration, not recursion

def fibonacci(n)
  first = 1
  second = 1
  sum = 1 # book uses parallel assignment rather than intermediate variable
  
  (n - 2).times do # book uses 3.upto
      sum = first + second
      first = second
      second = sum
    end
  sum
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(4)
p fibonacci(5)
p fibonacci(6)
p fibonacci(7)
p fibonacci(8)
p fibonacci(20) #== 6765
p fibonacci(100) #== 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501

# Book solution assigned values to an array (parallel assignment) and then updated the variables
# using the iterative Integer#upto. Basically the same as what I did, except
# I had an intermediate variable, sum, and used the #times iterative method

def book_solution(n) # removed array to show that it is not necessary
  first, last = 1, 1
  
  3.upto(n) do
    first, last = last, (first + last)
    # parallel assignment removes the need for an intermediary variable (like sum).
    # The values aren't affected by assignment itelf. (see below)
  end
  
  last
end

p book_solution(8)

# if you tried
  # first = last
  # last = first + last
    # first would already have been assigned to last and last would just be doubling itself
# so you either need an intermediary:
  # sum = first + last
  # first = last
  # last = sum
# OR, parallel assigment
  # first, last = last, first + last
