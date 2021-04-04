=begin
# Question 1
def design(string)
  10.times { |index| puts string.rjust(string.length + index) }
end

design("The Flintstones Rock!")

# Question 2
  # puts "the value of 40 + 2 is " + (40 + 2)
  # above throws error because trying to concat string with integer.
  # no implicit conversion of Integer into String.
  # fix by string interpolation: (or call .to_s)
puts "the value of 40 + 2 is #{(40 + 2)}"

# Question 3
# the below fails because nothing stops the loop if it is given 0 or 
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
# my solution is below. 0 or negative numbers return a blank array (no factors)
def factors(number)
  (1..number).to_a.select { |divisor| number % divisor == 0 }
end
# bonus 1: number % divisor is to check whether the divisor is a factor (no remainder)
# bonus 2: the factors call at the bottom is to make sure the method returns the factors array.
# the book solution turned it into a while loop. If a zero or negative number is supplied, the
# while condition is violated and the loop ends
p factors(24)
p factors(-24)
p factors(0)

# Question 4
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # calling argument is modified (strings also work)
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] # calling argument is not modified, and strings don't work
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

p rolling_buffer1([1, 2, 3], 10, 4)
p rolling_buffer2([1, 2, 3], 10, 4)

# Question 5
# limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit # the limit variable is not in the method scope. Must be passed in as an argument.
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"
=end
# Question 6
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # answer is 34, because numbers cannot be mutated. And some_number is only reassigned anyway.
# use new_answer and it would be 42, however.

# Question 7
# with a little test in irb, it should modify the hash, because the values are being reassigned.
# the munsters hash is being pointed to by the actual object id passed as an argument
# the object id is not reassigned, but modified (by reassigning elements)
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
mess_with_demographics(munsters)
p munsters
# Question 8
# worked on paper, basically simplifying the expression.
# Question 9
# Just worked it out in my head. 
