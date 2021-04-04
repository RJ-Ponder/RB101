def multiply(n1, n2)
  n1 * n2
end

def square(n)
  multiply(n, n)
end

#further exploration (student answers have better versions of below)
def power(n1, n2)
  n1 ** n2
end

def power2(number, power)
  if power % 2 == 0
    ([multiply(number,number)] * (power/2)).reduce(:*)
  else
    ([multiply(number,number)] * (power/2)).reduce(:*) * number
  end
end

puts power(7, 5)
puts power2(7, 5)

# student version (Ryan Parkerson). Takes care of negative numbers nicely.
# more elegant in converting to array and reducing. No need for the odd power workaround
def multiply(num1, num2)
  num1 * num2
end

def number_to_power(num, power)
  if power == 0
    1
  elsif power > 0
    multiply([num], power).reduce(:*)
  elsif power < 0
    1.0 / (multiply([num], power.abs).reduce(:*))
  end
end

# student version 2 (Ricky Viejo)
def power_of_n(n, power)
  result = 1
  power.times {result = multiply(n, result)} # similar to recursion
  result
end

# student version 3 (Chris Hallberg) (note that negative numbers don't work)
# the recursion keeps adding things to multiply together until 0 is reached and then it multiplies by 1.
def multiply(a, b)
  a * b
end

def power(a, n)
  n == 0 ? 1 : multiply(a, power(a, n - 1))
end