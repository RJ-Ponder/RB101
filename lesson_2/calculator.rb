require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

def operation_to_message(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
         end
  word
end
        
prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do # main loop
  
  number1 = '' #initializing the variable outside the loop block construct allows us to access it throughout the program
  
  loop do
    prompt(MESSAGES['number1'])
    number1 = gets.chomp # without chomp() a newline /n is attached to the user input (enter key). chomp() returns a new string with no whitespace characters
    
    if valid_number? number1
      break
    else
      prompt(MESSAGES['number_validation'])
    end
  end
  
  number2 = ''
  loop do
    prompt(MESSAGES['number2'])
    number2 = gets.chomp
    
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['number_validation'])
    end
  end
  
  #operator_prompt = <<-MSG
   # What operation would you like to perform?
    #1) add
    #2) subtract
    #3) multiply
    #4) divide
  #MSG
  # three letters MSG can be anything as long as they match. Delimeters.
  
  prompt(MESSAGES['operator_prompt'])
  
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operation_validation'])
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
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end
  
  prompt("#{operation_to_message(operator)} the two numbers...")
  
  prompt("The result is #{result}")
  
  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])