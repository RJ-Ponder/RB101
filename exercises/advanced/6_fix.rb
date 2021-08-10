=begin
Find and fix the bug, then explain why the buggy program printed the results it did.
=end

def my_method(array)
  if array.empty?
    []
  elsif # without a conditional here
    array.map do |value| # elsif uses this as the conditional (always truthy)
      value * value
    end
    # since there is no code to be used for the execution, nil is returned
  else
    [7 * array.first]
  end
end

# To fix this can add a conditional to the elsif, e.g. array.size != 1

p my_method([]) #== []
p my_method([3]) #== [21]
p my_method([3, 4]) #== [9, 16]
p my_method([5, 6, 7]) #== [25, 36, 49]
