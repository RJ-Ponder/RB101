# pick out the minimum age from our current Munster family hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# brute force algorithm: iterate through every value and compare the current age to the saved age
# if the current age is lower than the saved age, assign it to the saved age
# only problem is you have to make sure the initialized age is larger than every age in the hash
# could make the initialized age = the first element

saved_age = ages.values.first

ages.each do |name, age| # decided to iterate with each, but could also have used loop and a counter
  current_age = age
  if current_age < saved_age
    saved_age = current_age
  end
end

p saved_age

# an easier way is to call the values method of the hash and then the min method on the returned array
p ages.values.min # this is the book solution, but I found this without looking.

