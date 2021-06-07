# Given this nested hash, figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_age_sum = 0
munsters.each_pair do |key, value|
  if value["gender"] == "male"
    male_age_sum += value["age"]
  end
end
p male_age_sum

# to refactor like the book solution, you can use #each_value since the outer 
# key isn't use. Then you can use a single line if statement since there is not 
# a different conditional you're interested in:

male_age_sum = 0
munsters.each_value do |value|
  male_age_sum += value["age"] if value["gender"] == "male"
end
p male_age_sum