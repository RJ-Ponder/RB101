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


order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

all_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # rest of data
]

fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]

all_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value]
  end

  all_orders[index][:total_order_value] = order_value
end

all_orders = customer_orders.map do |customer_data|
  order_value = customer_data[:orders].inject(0) do |total, order_data|
    total + order_data[:order_value]
  end

  {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: order_value
  }
end

all_orders = []

customer_orders.each do |customer_data|
  customer_total_orders = {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: 0
  }

  customer_data[:orders].each do |order|
    customer_total_orders[:total_order_value] += order[:order_value]
  end

  all_orders << customer_total_orders
end

all_orders = []

customer_orders.each do |customer_data|
  cust_arr = [
    [:customer_id, customer_data[:customer_id]],
    [:customer_name, customer_data[:customer_name]],
    [:total_order_value]
  ]

  order_value = 0
  customer_data[:orders].each do |order|
    order_value += order[:order_value]
  end

  cust_arr[2] << order_value

  all_orders << cust_arr
end


