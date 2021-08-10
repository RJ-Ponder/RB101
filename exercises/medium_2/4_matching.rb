=begin
Write a method that takes a string as an argument, and returns true if all 
parentheses in the string are properly balanced, false otherwise. 
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).

Problem
- determine if the string has balanced parenthesis
Rules
- If there is a "(" there must be a corresponding ")"
- There cannot be a ")" when the balance is 0 or else you can't close it
Algorithm
- "(" is left and is +1
- ")" is right and is -1
- balance = 0
- iterate through the string
- if there is a "(" balance += 1
- if there is a ")" balance -= 1
- return false if balance is ever < 0
- test if balance == 0 at the end
=end

def balanced?(string)
  balance = 0
  string.each_char do |char|
    balance += 1 if char == "("
    balance -= 1 if char == ")"
    return false if balance < 0
  end
  balance == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?("(hi") == false
p balanced?("(hi)") == true
p balanced?("(()) hi") == true
p balanced?(")(") == false
p balanced?("()((((()))))(())()") == true
p balanced?("(()())()(())()(") == false
p balanced?("") == true

=begin
Further Exploration
There are a few other characters that should be matching as well. Square 
brackets and curly brackets normally come in pairs. Quotation marks (single and 
double) also typically come in pairs and should be balanced. Can you expand this 
method to take into account those characters?
=end