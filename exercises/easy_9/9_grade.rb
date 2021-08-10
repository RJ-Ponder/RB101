def get_grade(one, two, three)
  avg = (one + two + three) / 3
  case
    when avg >= 90 then 'A'
    when avg >= 80 then 'B'
    when avg >= 70 then 'C'
    when avg >= 60 then 'D'
    else                'F'
  end
end

# book solution uses case a little different
# case average
# when 90..100 then 'A'
# etc.
# this way the average can be compared in a range
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'


def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90.. then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end


p get_grade(100, 110, 110) #== "A"

# Further Exploration:
  # When grade is > 100, you can use an unbounded range like above
  