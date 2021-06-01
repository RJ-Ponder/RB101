# # Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "$^JAGj9fyn 2474 J$45 j@$%@  yfinglkjst hoing;dahg " #The Flintstones Rock"

# def letter_frequency(string)
#   all_letters = string.split('')
#   all_letters.delete(' ') # this way of doing it only works on strings with letters and spaces
#   unique_letters = all_letters.uniq
  
#   counter = 0
#   frequency_hash = {}
  
#   loop do
#     break if counter == unique_letters.count
#     frequency_hash[unique_letters[counter]] = all_letters.count(unique_letters[counter])
    
#     counter += 1
#   end
  
#   frequency_hash
# end

# letter_frequency(statement)



# is there an easier way to do this? Refactoring my solution above based on book's:
all_letters = statement.chars.select { |char| char.match?(/[a-zA-Z]/) } # filters anything that isn't a letter
unique_letters = all_letters.uniq
  
frequency_hash = {}
  
unique_letters.each do |letter|
  frequency_hash[letter] = all_letters.count(letter)
end

p frequency_hash
