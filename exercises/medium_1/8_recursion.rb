# In Easy_6 Exercises I worked on a recursive Fibonacci method already.
# I worked on it to try and understand recursion better.
# Here I am rewriting it without looking at my previous work as a refresher

# Some notes, iterative methods build up to a solution.
# Recursive methods break down a solution to it's simplest core and calls itself

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 2) + fibonacci(n - 1)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci2(nth)
  fibonacci_tail(nth, 1, 1)
end

p fibonacci(40)
p fibonacci2(8000)
