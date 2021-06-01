# Problem
  # Given a string of words separated by spaces, write a method that takes this 
  # string of words and returns a string in which the first and last letters of 
  # every word are swapped.
  # You may assume that every word contains at least one letter, and that the 
  # string will always contain at least one word. You may also assume that each 
  # string contains nothing but words and spaces
# Examples / Test Cases
  # swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  # swap('Abcde') == 'ebcdA'
  # swap('a') == 'a'
# Data Structures
  # Input: string
  # Output: new string
# Algorithm
  # turn the string into an array of words
  # iterate through the array
  # for each word in the array, assign the first letter to the last
  # and assign the last letter to the first
  # join the array into a string and return the value
# Code with intent

# def swap(string)
#   array = string.split(' ')
#   array.each do |word|
#     word.insert(-2, word[0])
#     word[0] = word[-1]
#     word[-1] = ''
#   end
#   array.join(' ')
# end

# I thought there might be a parallel way to make the swap
# The book solution shows this. # essentially it uses the right hand side to
# create a temporary array [last_letter, first_letter]; then it assigns the left
# side to the corresponding values in the temporary array
#Refactoring my code:

def swap(string)
  array = string.split(' ')
  array.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  array.join(' ')
end

# Further Exploration:
# Swapping only the letters would not work, because it won't link to the original
# word. You end up assigning two letters in the array, which then gets split
# into a lot of first and last letters, but no words. (incomplete understanding)

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word[0], word[-1])
#   end
#   result.join(' ')
# end

p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
p swap('Abcde') #== 'ebcdA'
p swap('a') #== 'a'
p swap('here is another test to see what happens with a longer string')
