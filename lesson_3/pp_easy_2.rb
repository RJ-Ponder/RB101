# Question 1
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  ages["Spot"]
  ages.fetch("Spot", "Error, not found")
  ages.key?("Spot") #has_key? #include? #member? all aliases
# Question 2
  munsters_description = "The Munsters are creepy in a good way."
  munsters_description.swapcase!
  munsters_description.capitalize!
  munsters_description.downcase!
  munsters_description.upcase!
# Question 3
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  ages["Marilyn"] = 22
  ages["Spot"] = 237
  additional_ages = { "Marilyn" => 22, "Spot" => 237 } # didn't realize I should use this hash.
  ages.merge!(additional_ages)
# Question 4
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.include?("Dino")
  advice.match?("Dino") # book solution
# Question 5
  flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # called General Delimited Input
# Question 6
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  flintstones << ('Dino')
  flintstones.push('Dino')
# Question 7
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  flintstones.push("Dino", "Hoppy")
  flintstones.concat(["Dino", "Hoppy"])
# Question 8
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.slice(39..72)
  advice.slice!(0...39)
  advice.slice(0, advice.index("house"))
# Question 9
  statement = "The Flintstones Rock!"
  statement.count("t")
# Question 10
  title = "Flintstone Family Members"
  title.center(40)