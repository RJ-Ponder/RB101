# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. 
# You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, 
# you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an 
# Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# Round (n)     1     2     3     4     5     6     7     8     9     (n lights)
# 0             OFF   OFF   OFF   OFF   OFF   OFF   OFF   OFF   OFF
# 1             ON    ON    ON    ON    ON    ON    ON    ON    ON
# 2                   OFF         OFF         OFF         OFF   
# 3                         OFF               ON                OFF
# 4                               ON                      ON        
# 5                                     OFF   
# 6                                           OFF 
# 7                                                 OFF         
# 8                                                       OFF
# 9                                                             ON


# Rules:
# n number of lights
# n number of rounds
# if light is a multiple of n, it is toggled

# Data Structures
  # use a hash to store lights as keys and on/off (true, false) as values
  # return an array of keys that are on (true)
# Algorithm

def toggle_lights(number_of_lights)
  # initialize the lights hash
  lights = {}
  1.upto(number_of_lights) do |num|
    lights[num] = false
  end
  # toggle every nth light in the lights hash
  1.upto(number_of_lights) do |num|
    lights.each do |position, state|
      lights[position] = !state if position % num == 0
    end
  end
  # return list of light numbers that are on
  lights.select { |_position, state| state == true }.keys
end

p toggle_lights(5) # => [1, 4]
p toggle_lights(10) # => [1, 4, 9]
p toggle_lights(100) # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

# I noticed that the lights that stay on are perfect squares. Knowing this
# it could have been programmed mathematically

# Further Exploration
# There are a few interesting points about this exercise that we can explore:
# Why are the lights left on perfect squares? 
  # Because all other numbers are divisible by itself, resulting in a total
  # number of toggles being even and returning to initial state.
  # Only perfect squares have a factor that is multiplied by itself, resulting in 
  # an odd number of total divisors which changes the overall toggle state.
  
# Examples of factoring a number:
  # 8 => (1, 2, 4, 8) an even number of factors
  # 60 => (1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60) an even number of factors
  # whereas for a perfect square, one of the factorials is itself
  # 9 => (1, 3, 9) an odd number of factors
  # 64 => (1, 2, 4, 8, 16, 32, 64) an odd number of factors
  
# What are some alternatives for solving this exercise? 
# What if we used an Array to represent our 1000 lights instead of a Hash, how would that change our code?
  # We would have to have an array of the status and use the index to track the iterations
# We could have a method that replicates the output from the description of this problem
#(i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go about writing that code?
  # Would have to store the on and off values in arrays and convert to strings with 
  # some joining way that is natural. Then interpolate it into the final string

# I submitted my solution, see User-Submitted solutions for cleaner write-up
