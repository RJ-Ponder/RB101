# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort { |a, b| a[:published] <=> b[:published] }

# in this case I could have used sort_by to access a particular part:
p books.sort_by { |book| book[:published] }
# note that comparing strings works here because all of them are four characters in length
# otherwise, would need to convert to an integer
# also, the comparison was from early to late, other way around could call #reverse!
