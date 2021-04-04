# How can we change this code to make the result easier to predict and easier for the next programmer to maintain?
# 1) rename the method so it tells you if it modifies or not
# 2) make what happens to the array and string the same (use the same operator)
# 3) book solution explicitly returns something from the method and then assigns the return value to my_string and my_array
# 4) this lets you know what the intention is (don't need to worry about modifying or not)
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"