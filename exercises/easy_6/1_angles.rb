DEGREE = "\xC2\xB0"
CONVERSION = 60

def dms(degree_float)
  degree = degree_float.to_i
  minute_float = (degree_float - degree).round(4) * CONVERSION
  minute = minute_float.to_i
  second_float = (minute_float - minute) * CONVERSION
  second = second_float.round
  
  degree_string = degree.to_s
  minute_string = sprintf("%02d", minute)
  second_string = sprintf("%02d", second)
  
  %(#{degree_string}#{DEGREE}#{minute_string}'#{second_string}")
end

# NEED TO REFACTOR
# COME BACK TO FUTHER EXPLORATION IF YOU WANT

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

