def fibonacci_last(n)
  first = 1
  second = 1
  sum = 1 # book uses parallel assignment rather than intermediate variable
  
  (n - 2).times do # book uses 3.upto
    sum = first + second
    sum %= 10 # I had a conditional here to determine if the digit was > 2, but after book solution realized it was extraneous
      # because % 10 keeps it from ever becoming > 2 digits
    first = second
    second = sum
  end
  sum #.to_s[-1].to_i was way too slow for 1_000_007, needed to keep the numbers small with sum % 10
end

# p fibonacci_last(15)        # -> 0 (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(58)        # -> 9 (the 98th Fibonacci number is 135301852344706746049)
# p fibonacci_last(61)        # -> 6 (the 99th Fibonacci number is 218922995834555169026)
# p fibonacci_last(62)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4 # takes between 20 and 25 seconds to execute; others above are fast <1 second)
#                                   # Getting rid of the conditional (see above) shaved off about 10 seconds

# Further Exploration
  # After a while, even this method starts to take too long to compute results. 
  # Can you provide a solution to this problem that will work no matter how big the number? 
  # You should be able to return results almost instantly. 
  # For example, the 123,456,789,987,745th Fibonacci number ends in 5.

# First I'll find if the pattern repeats itself anywhere. That is, see if there are
# two consecutive numbers in the fibonacci sequence where the last digits are 1 and 1.

# Modifying the book solution:
# note that the book kind of changed their approach and didn't do parallel assignment but actually utilized an array here.
def pattern_repeat(n)
  last = [1, 1]
  counter = 0
  loop do
    last = [last.last, (last.first + last.last) % 10]
    break p "#{counter}" if last == [1, 1]
    counter += 1
  end
end

# p pattern_repeat(100000)

# Success! I found that the pattern does repeat itself. The 61st and 62nd position in the
# Fibonacci sequence both have digits ending in 1. That means that I can find the remainder
# of the number divided by 60, and plug that into my original method. I will never
# have to compute the value of a number larger than 60, so will get almost instant results.

def instant(n)
  cycle = n % 60
  
  first = 1
  second = 1
  sum = 1
  
  (cycle - 2).times do
    sum = first + second
    sum %= 10
    first = second
    second = sum
  end
  sum
end

p instant(15)        # -> 0  (the 15th Fibonacci number is 610)
p instant(20)        # -> 5 (the 20th Fibonacci number is 6765)
p instant(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p instant(100_001)   # -> 1 (this is a 20899 digit number)
p instant(1_000_007) # -> 3 (this is a 208989 digit number)
p instant(123456789) # -> 4

p instant(123_456_789_987_745) # -> 5
