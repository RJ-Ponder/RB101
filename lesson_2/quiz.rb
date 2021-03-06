=begin
def name
  "George"
end

def display_name
  name = "Lisa"
  puts name() # the () make it the method and not the variable
end

display_name

def name
  "George"
end

name = "Lisa"

def display_name(name)
  puts name()
end

display_name(name)

def name
  "George"
end

name = "Lisa"

def display_name(name)
  puts name
end

display_name(name)
=end



def name
  "George"
end
name = "Lisa"
loop do
  puts name()
  break
end