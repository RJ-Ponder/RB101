# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name = name[0, 3] } # Can actually remove name = and it does the same thing

p flintstones