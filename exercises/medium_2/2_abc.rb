=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do 
not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be 
spelled from this set of blocks, false otherwise.

Problem
- return true if the word can be spelled using the above blocks
- return false if it can't
Assumptions
- only one block per word is provided
- only single words will be input
- case does not matter
- if there are extra characters in the input not on any of the blocks then return false
Data structure
- input: string
- output: boolean
Algorithm
- go one letter at a time
- if the character is not found in the list at all, return false
- if the letter is found later in the word, return false
- if the letter's matching letter is found later in the word, return false
- if you iterate through the whole word and it doesn't return false, return true

- 'batch'.each_char
    word[index + 1..-1]
- b => atch.include?(b) || include?(corresponding)
- a => tch
- t => ch
- c => h
- h => ""

=end

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

LIST = { 'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q', 'e' => 'r', 
         'f' => 's', 'g' => 't', 'h' => 'u', 'i' => 'v', 'j' => 'w', 
         'k' => 'x', 'l' => 'y', 'm' => 'z', 'n' => 'a', 'o' => 'b',
         'p' => 'c', 'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
         'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k', 'y' => 'l', 'z' => 'm' }

def block_word?(string)
  string.downcase.each_char.with_index do |letter, index|
    return false unless LIST.keys.include?(letter)
    return false if string.downcase[index + 1..-1].include?(letter)
    return false if string.downcase[index + 1..-1].include?(LIST[letter])
  end
  true
end

# Book solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true