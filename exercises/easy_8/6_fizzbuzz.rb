def fizzbuzz(first, last)
  array = (first..last).to_a
  fizzbuzz_arr = array.map do |num|
    if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
  end
  puts fizzbuzz_arr.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Book solution uses two methods, one to get value and another to put it in a result
# The method to get the value uses the case statement
