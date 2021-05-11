# Select the key value pairs where the value is "Fruit"

produce = {
 
}

def select_fruit(hash)
  counter = 0
  
  selected_hash = {}
  
  keys = hash.keys
  
  loop do
    break if counter == hash.length # moved to top in case produce hash is empty
    
    current_key = keys[counter]
    current_value = hash[current_key]
    
    if current_value == 'Fruit'
      selected_hash[current_key] = current_value
    end
    
    counter += 1
    
  end
  
  selected_hash
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}