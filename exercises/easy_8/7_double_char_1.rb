def repeater(string)
  new_string = ''
  string.each_char do |char|
    new_string << char * 2
  end
  new_string
end

p repeater('Hello') #== "HHeelllloo"
p repeater("Good job!") #== "GGoooodd  jjoobb!!"
p repeater('') #== ''
