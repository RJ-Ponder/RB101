def crunch(string)
  crunched_array = []
  string.chars.each do |char|
    crunched_array << char unless crunched_array.last == char
  end
  crunched_array.join
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''

# Come back to further exploration if you want
