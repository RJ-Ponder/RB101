def letter_case_count(string)
  lowercase_count = 0
  uppercase_count = 0
  neither_count = 0
  
  string.each_char do |char|
    if char.match?(/[a-z]/)
      lowercase_count += 1
    elsif char.match?(/[A-Z]/)
      uppercase_count += 1
    else
      neither_count += 1
    end
  end
  { lowercase: lowercase_count, uppercase: uppercase_count, neither: neither_count }
end
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
