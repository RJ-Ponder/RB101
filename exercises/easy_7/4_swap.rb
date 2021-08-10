def swapcase(string)
  new = ""
  string.each_char do |char|
    if char.match?(/[a-z]/)
      new << char.upcase
    elsif char.match?(/[A-Z]/)
      new << char.downcase
    else
      new << char
    end
  end
  new
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# book solution uses chars to create array, then map, and then join
