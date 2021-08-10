def staggered_case(string)
  staggered_string = ""
  upcase = true
  string.each_char do |char|
    if char.match?(/[^A-Za-z]/)
      staggered_string << char.upcase
    elsif upcase
      staggered_string << char.upcase
      upcase = !(upcase)
    else
      staggered_string << char.downcase
      upcase = !(upcase)
    end
  end
  staggered_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


# use book solution of toggling boolean to practice.
# further exploration to make it flexible to work like last solution or
# this one. That is whether to include non-alpha characters when toggling or not
# This is not attempted for now