# Add up all the ages from the following hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_of_ages = 0
p ages.each { |key, value| sum_of_ages += value }
p sum_of_ages