if false
  greeting = "hello world"
end

p greeting

# I expect that the variable is undefined because the variable is not available in the if block
# My prediction above is incorrect. I didn't think if statements worked like blocks with variable scope.
# Usually if you reference an uninitialized variable, an exception is thrown
# When a variable is initialized in within the if block, it is initialized to nil, even if the block is not executed.