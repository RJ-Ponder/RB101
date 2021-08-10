# def joinor(array, punctuation = ', ', conjunction = 'or')
#   copy = array.dup
#   last = copy[-1]
#   if array.size <= 1
#     copy
#   elsif array.size == 2
#     copy.insert(-2, " #{conjunction} ")
#   else
#     copy.map! { |element| element.to_s << punctuation }
#     copy.insert(-2, "#{conjunction} ").pop
#     copy.insert(-1, last)
#   end
#   copy.join
# end

# p joinor([1])                      # => "1"
# p joinor([1, 2])                   # => "1 or 2"
# p joinor([1, 2, 3])                # => "1, 2, or 3"
# p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
# p joinor([1, 2, 3, 4, 5, 6, 7, 8, 9])

def joinor(empty_squares, punctuation = ', ', conjunction = 'or')
  last_square = empty_squares[-1]

  if empty_squares.size <= 1
    empty_squares
  elsif empty_squares.size == 2
    empty_squares.insert(-2, " #{conjunction} ")
  else
    empty_squares.map! { |element| element.to_s << punctuation }
    empty_squares.insert(-2, "#{conjunction} ").pop
    empty_squares.insert(-1, last_square)
  end

  empty_squares.join
end

empty_sq = [1, 2, 3, 4, 5, 6, 7, 8, 9]
p joinor(empty_sq)
p empty_sq

# Book solution:
def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end
