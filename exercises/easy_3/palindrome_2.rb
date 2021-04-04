def real_palindrome?(value)
  alphanumeric_value = value.downcase.gsub(/[^0-9a-z]/i, '').delete(' ')
  alphanumeric_value == alphanumeric_value.reverse
end
# I had read the documentation for delete, but still didn't realize I could use it.
# alphanumeric_value = value.downcase.delete('^a-z0-9')
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
