# Problem 
  # The time of day can be represented as the number of minutes before or after 
  # midnight. If the number of minutes is positive, the time is after midnight. 
  # If the number of minutes is negative, the time is before midnight.
  # Write a method that takes a time using this minute-based format and returns 
  # the time of day in 24 hour format (hh:mm). Your method should work with 
  # any integer input.
  # You may not use ruby's Date and Time classes.
# Examples / Test Cases
  # time_of_day(0) == "00:00"
  # time_of_day(-3) == "23:57"
  # time_of_day(35) == "00:35"
  # time_of_day(-1437) == "00:03"
  # time_of_day(3000) == "02:00"
  # time_of_day(800) == "13:20"
  # time_of_day(-4231) == "01:29"
# Data Structures
  # Input: any negative or positive integer
  # Output: string in 24 hour time format
# Algorithm
  # divide the integer by 1440 to determine days
  # multiply the decimal remainder by 1440 to determine minutes (in partial day)
  # divide minutes in partial day by 60 to determine hours
  # multiply decimal remainder by 60 to determine minutes (in partial hour)
  # If positive, add hours and minutes to zero and display
  # If negative, subtract hours from 24 and minutes from 60 and display
# Code with intent

# def time_of_day(total_minutes)
#   formatting = {
#             0 => "00", 1 => "01", 2 => "02", 3 => "03", 4 => "04",
#             5 => "05", 6 => "06", 7 => "07", 8 => "08", 9 => "09"
#           }
  
#   partial_day_minutes = total_minutes.abs.remainder(1440)
#   hours = partial_day_minutes / 60
#   minutes = partial_day_minutes.remainder(60)
  
#   if total_minutes < 0
#     hours = 23 - hours
#     minutes = 60 - minutes
#   end
  
#   if hours < 10
#     formatted_hours = formatting[hours]
#   else
#     formatted_hours = hours
#   end
  
#   if minutes < 10
#     formatted_minutes = formatting[minutes]
#   else
#     formatted_minutes = minutes
#   end
  
#   "#{formatted_hours}:#{formatted_minutes}"
# end

# Further exploration:
# Found out that modulo (%) actually works to normalize negative minutes how
# we would want in this example. Wraps the minutes around 1440.
# also, format is useful instead of the hash and if statements:

# Refactored code below:

def time_of_day(total_minutes)
  
  normalized_minutes = total_minutes % 1440
  hours, minutes = normalized_minutes.divmod(60)
  
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"

# Skipped problem 2 and 3 of further exploration