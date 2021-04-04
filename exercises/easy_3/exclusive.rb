=begin
AND
true, true ==> true
true, false ==> false
false, true ==> false
false, false ==> false

OR
true, true ==> true
true, false ==> true
false, true ==> true
false, false ==> false

XOR
true, true ==> false
true, false ==> true
false, true ==> true
false, false ==> false
=end

def xor(boolean_1, boolean_2)
  !!boolean_1 == !!boolean_2 ? false : true # this is explicit return
end

def xor?(value1, value2)
  !value1 != !value2 # a little simplified of above (Ryan Parkenson)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false