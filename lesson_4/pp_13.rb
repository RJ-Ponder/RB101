# Remove people with ages 100 and greater in the hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

youngsters = ages.reject {|name, age| age >= 100 } # reject is not destructive

p youngsters

# book solution: note that select could be used, but if nothing changed, nil is returned. 
# ages.keep_if { |_, age| age < 100 }