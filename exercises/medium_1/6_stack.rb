# The stack is an array
# The register is an integer (I originally had this as an array thinking I would pass 
# it as a parameter to different methods and would need to be able to modify it.)
# That is, originally wrote everything as register = [0] and register[0] = ...
# Otherwise, my solution was exactly as the book's

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

def minilang(program)
  stack = []
  register = 0
  
  program.split.each do |command|
    case
    when command == "PUSH"
      stack.push(register)
    when command == "ADD"
      return p "Empty stack error." if stack.empty?
      # I don't like the repetitive nature of this error check,
      # but I don't want to go down a rabbit hole right now.
      register += stack.pop
    when command == "SUB"
      return p "Empty stack error." if stack.empty?
      register -= stack.pop
    when command == "MULT"
      return p "Empty stack error." if stack.empty?
      register *= stack.pop
    when command == "DIV"
      return p "Empty stack error." if stack.empty?
      register /= stack.pop
    when command == "MOD"
      return p "Empty stack error." if stack.empty?
      register %= stack.pop
    when command == "POP"
      return p "Empty stack error." if stack.empty?
      register = stack.pop
    when command == "PRINT"
      p register
    when !!(command =~ /\A[-+]?[0-9]+\z/) # error checking for integer string
      register = command.to_i # this was originally the else condition, but added error checking for further exploration
    else
      p "Invalid command prompt."
      return
    end
  end
end

minilang('5 DIV') # empty stack condition error checking
minilang('5 PUSH TEST') # Invalid command prompt test.
minilang('PRINT') # 0
minilang('5 PUSH 3 MULT PRINT') # 15
minilang('5 PRINT PUSH 3 PRINT ADD PRINT') #5 3 8
minilang('5 PUSH POP PRINT') # 5
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT') # 5 10 4 7
minilang('3 PUSH PUSH 7 DIV MULT PRINT') # 6
minilang('4 PUSH PUSH 7 MOD MULT PRINT') # 12
minilang('-3 PUSH 5 SUB PRINT') # 8
minilang('6 PUSH') # (nothing printed; no PRINT commands)

# Further Exploration
  # Try writing a minilang program to evaluate and print the result of this expression:
    # (3 + (4 * 5) - 7) / (5 % 3)
# The answer should be 8. This is trickier than it sounds! Note that we aren't 
# asking you to modify the #minilang method; we want you to write a Minilang 
# program that can be passed to #minilang and evaluated.

# Add some error handling to your method. In particular, have the method detect 
# empty stack conditions, and invalid tokens in the program, and report those. 
# Ideally, the method should return an error message if an error occurs, and 
# nil if the program runs successfully.

# I added very primitive (and repetitive) error checking for both empty stacks and invalid tokens

# below is my program to evaluate the above expression:
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 5 PUSH 4 MULT ADD SUB DIV PRINT')
