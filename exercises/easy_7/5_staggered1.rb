def staggered_case(string)
  new = ""
  counter = 0
  string.each_char do |char|
    if counter.even?
      new << char.upcase
    else
      new << char.downcase
    end
    counter += 1
  end
  new
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# instead of a counter, the book solution uses a boolean that they toggle true
# false. This can be set as a method parameter easily if wanted.
