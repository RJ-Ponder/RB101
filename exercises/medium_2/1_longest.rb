# text = File.read('text.txt')

# def longest(text)
#   longest_sentence = ""
#   longest_length = 0
#   text.split(/\.|\?|!/).each do |sentence|
#     length = sentence.split(" ").size
#     if length > longest_length
#       longest_length = length
#       longest_sentence = sentence
#     end
#   end
#   puts "#{longest_sentence} ==> #{longest_length} words"
# end

# longest(text)

text = File.read('text.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"

# Further exploration not attempted at this time.