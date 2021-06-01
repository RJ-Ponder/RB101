# Modify the hash such that each member of the Munster
# family has an additional "age_group" key that has one 
# of three values describing the age group the 
# family member is in (kid, adult, or senior). 

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# to access the age, munsters[name]["age"]
# to create a new category for the name, munsters["Herman"]["age_group"] = "adult"
# cases: kid is 0 - 17, adult is 18 - 64, senior is 65+
# iterate through the hash, key is name and value is the category hash

munsters.each do |name, category_hash|
  case category_hash["age"]
  when 0..17
    munsters[name]["age_group"] = "kid"
  when 18..64
    munsters[name]["age_group"] = "adult"
  else
    munsters[name]["age_group"] = "senior"
  end
end

p munsters # I ended up with almost exactly the book solution without looking

# refactored below, not sure if any advantage
munsters.each do |name, category_hash|
  case category_hash["age"]
  when 0..17
    age_group = "kid"
  when 18..64
    age_group = "adult"
  else
    age_group = "senior"
  end
  munsters[name]["age_group"] = age_group
end

# result hash
# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
  