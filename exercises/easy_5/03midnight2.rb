# Problem
  # Write two methods that each take a time of day in 24 hour format, and return 
  # the number of minutes before and after midnight, respectively. Both methods 
  # should return a value in the range 0..1439.
# Examples / Test Cases
  # after_midnight('00:00') == 0
  # before_midnight('00:00') == 0
  # after_midnight('12:34') == 754
  # before_midnight('12:34') == 686
  # after_midnight('24:00') == 0
  # before_midnight('24:00') == 0
# Data Structures
  # Input: string in the 24 hour format 'hh:mm' (including 24:00)
  # Output: integer
# Algorithms
# After midnight:
  # take first two places in 24 hour format and convert to integer, hours
  # take last two place in 24 hour format and convert to integer, minutes
  # convert hours to minutes and add to minutes
# Before midnight:
  # take first two places in 24 hour format and convert to integer, hours
  # subtract from 24 and multiply by 60 to convert to minutes
  # take last two places in 24 hour format and convert to integer, minutes
  # subtract from 60 and add to other minutes
# Code with intent

def after_midnight(time)
  hours = time[0, 2].to_i
  minutes = time[3, 2].to_i
  ((hours * 60) + minutes) % 1440 # changed this from an if statement setting
  # hours to zero if == 24
end

def before_midnight(time)
  minutes = 1440 - after_midnight(time)
  minutes = 0 if minutes == 1440 # rewrote as one line
  minutes
end

p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34') #== 686
p after_midnight('08:00') #
p before_midnight('08:00') #
p after_midnight('08:01') #
p before_midnight('08:01') #
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0

# Further exploration not done
# Look into Date and Time classes