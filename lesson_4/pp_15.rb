# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

def first_two_letters(array, letters)
  
  counter = 0
  first_index = "Letters not found"
  
  loop do
    if array.size == counter
      break
    elsif array[counter][0, 2] == letters
      first_index = counter
      break
    else
      counter += 1
    end
  end
  
  first_index
end

p first_two_letters(flintstones, "Be")

# I'm pretty sure there is an easier solution than above.
# Turns out there is. Found a way looking through documentation
p flintstones.index { |name| name[0, 2] == "Be" } # came up with exact book solution without looking