def greetings(name_array, occupation_hash)
  name = name_array.join(' ')
  title = occupation_hash[:title]
  occupation = occupation_hash[:occupation]
  
  puts "=> Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
