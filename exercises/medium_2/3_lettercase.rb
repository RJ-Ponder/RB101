def letter_percentages(string)
  uppercase = 0
  lowercase = 0
  neither = 0
  
  string.each_char do |char|
    uppercase += 1 if char.match?(/[A-Z]/)
    lowercase += 1 if char.match?(/[a-z]/)
    neither += 1 if char.match?(/[^a-zA-Z]/)
  end
  
  total = string.length
  u_percentage = (uppercase.to_f / total) * 100
  l_percentage = (lowercase.to_f / total) * 100
  n_percentage = (neither.to_f / total) * 100

  { lowercase: l_percentage, uppercase: u_percentage, neither: n_percentage }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }