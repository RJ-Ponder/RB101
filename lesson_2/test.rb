require 'yaml'
TEST = YAML.load_file('test.yml')

def prompt(message)
  puts "=> #{message}"
end
  

prompt(TEST['hello'])
prompt(TEST['greeting'])

puts TEST.inspect
