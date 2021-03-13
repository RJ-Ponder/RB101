# Question 1
  # uniq is not a destructive method. uniq! is.
# Question 2
  # ! after a method is part of the method, usually means destructive.
  # ! before is syntax. It will return the opposite of the objects boolean value
  # !! will return the objects bolean value
  # ? usually part of a method that will return a boolean
  # ? : is the ternary operator
# Question 3
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.gsub!('important', 'urgent')
# Question 4
  numbers = [1, 2, 3, 4, 5]
  numbers.delete_at(1)
  numbers.delete(1)
  # delete_at uses the index to delete the object in the array
  # delete uses the object itself to delete all instances
# Question 5
  (10..100).include?(42)
  (10..100).cover?(42)
# Question 6
  famous_words = "seven years ago..."
  famous_words.prepend("Four score and ")
  famous_words.insert(0, "Four score and ")
  # alternatively, from book solution:
  "Four score and " << famous_words
  "Four score and " + famous_words
# Question 7
  flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
  flintstones.flatten! # bang suffix added to modify the original array
# Question 8
  flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
  array = flintstones.to_a.select { |element| element[0] == "Barney" }.flatten
  # from book solution: didn't realize that's what the method #assoc does for a hash
  flintstones.assoc("Barney")