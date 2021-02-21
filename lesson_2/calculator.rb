# Rework this calculator to include the following features:
# 1) better integer and float validation
# 2) operation to message with better way of returing what you want
# 3) extracting messages to a configuration file so that they can be translated

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number? num # removing some () to train my eye
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
        
prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?
    prompt "Make sure to use a valid name."
  else
    break
  end
end

prompt "Hi, #{name}!"

loop do # main loop
  number1 = '' #initializing the variable outside the loop block construct allows us to access it throughout the program
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp() # without chomp() a newline /n is attached to the user input (enter key). chomp() returns a new string with no whitespace characters
    
    if valid_number? number1
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end
  
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    
    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end
  
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  # three letters MSG can be anything as long as they match. Delimeters.
  
  prompt(operator_prompt)
  
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end
=begin
  if operator == '1'
    result = number1.to_i() + number2.to_i() # note, even though the result variable is initialized within the if statement, the if statement does not create a block, and the variable is accessible outside. If unsure can initialize before.
  elsif operator == '2'
    result = number1.to_i() - number2.to_i()
  elsif operator == '3'
    result = number1.to_i() * number2.to_i()
  else
    result = number1.to_f() / number2.to_f() # to_f converts to float
  end
=end
  
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end
  
  prompt("#{operation_to_message(operator)} the two numbers...")
  
  prompt("The result is #{result}")
  
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")