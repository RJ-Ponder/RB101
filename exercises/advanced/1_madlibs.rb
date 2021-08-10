=begin
Let's build another program using madlibs. We made a program like this in the 
easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have 
created, and then plugs in a selection of randomized nouns, verbs, adjectives, 
and adverbs into that text and prints it. You can build your lists of nouns, 
verbs, adjectives, and adverbs directly into your program, but the text data 
should come from a file or other external source. Your program should read this 
text, and for each line, it should place random words of the appropriate types 
into the text, and print the result.

The challenge of this program isn't about writing your program; it's about 
choosing how to represent your data. Choose the right way to structure your data, 
and this problem becomes a whole lot easier. This is why we don't show you what 
the input data looks like; the input representation is your responsibility.

The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

adjectives: quick lazy sleepy ugly
nouns: fox dog head leg
verbs: jumps lifts bites licks
adverb: easily lazily noisily excitedly

Problem
- given an external text file, for example:
The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.
- write a program that plugs in a random noun, adverb, verb, or adjective 
in the place
- print the result

Algorithm
- basically need a way to replace this structure %{noun} with a random thing
=end

# ADJECTIVES = %w(stupid quick lazy sleepy ugly)
# NOUNS = %w(fox dog head leg)
# VERBS = %w(jumps lifts bites licks)
# ADVERBS = %w(easily lazily noisily excitedly)

# # turn the txt file into an array of sentences
# text = File.read('madlibs.txt').split("\n")

# # replace % with # and all parts of speech with speech.sample
# # text = text.gsub("%", "#")

# text = text.map do |sentence|
#   sentence.gsub("%{adjective}", ADJECTIVES.sample)
#   .gsub("%{noun}", NOUNS.sample)
#   .gsub("%{verb}", VERBS.sample)
#   .gsub("%{adverb}", ADVERBS.sample)
# end

# puts text.join("\n")

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end
puts ""

File.open('madlibs.txt').each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
end

