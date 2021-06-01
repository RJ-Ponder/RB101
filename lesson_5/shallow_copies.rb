# examples of #dup and #clone for mental model
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!
p arr2 # => ["a", "B", "c"]
p arr1 # => ["a", "B", "c"]

arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!
p arr2 # => ["cba", "def"]
p arr1 # => ["cba", "def"]
# Both of these methods create a shallow copy of an object. This means that only
# the object that the method is called on is copied. If the object contains other 
# objects - like a nested array - then those objects will be shared, not copied. 

# It's important to understand that the reason this happens is because the 
# destructive methods (String#upcase! and String#reverse!) were called on the 
# object within the array rather than the array itself. Since, as we've already 
# covered, those objects are shared, even if you mutate that object by referencing 
# it from within a particular array or other collection it is the object you are 
# affecting rather than the collection.

# below is a destructive action performed on the array itself, not on the object within the array
arr1 = ["a", "b", "c"]
arr_dup = arr1.dup
arr_clone = arr1.clone
arr_dup[0] = "z"
arr_clone[0] = "z"
p arr_dup
p arr_clone
p arr1

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

# arr1 # => ["a", "b", "c"]
# arr2 # => ["A", "B", "C"]

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

# arr1 # => ["A", "B", "C"]
# arr2 # => ["A", "B", "C"]

# In the first example arr2 is changed but arr1 is not. Here, we call the 
# destructive method Array#map! on arr2; this method modifies the array, 
# replacing each element of arr2 with a new value. Since we are changing the 
# Array, not the elements within it, arr1 is left unchanged.

# In the second example, both arr1 and arr2 are changed. Here, we call the 
# destructive String#upcase! method on each element of arr2. However, every 
# element of arr2 is a reference to the object referenced by the corresponding 
# element in arr1. Thus, when #upcase! mutates the element in arr2, arr1 is also 
# affected; we change the Array elements, not the Array.

# The important thing to be aware of is exactly what level you're working at, 
# especially when working with nested collections and using variables as pointers; 
# are you working at the level of an outer array or hash, or at the level of an object within that?

# The main difference between dup and clone is that clone preserves the frozen state of the object.