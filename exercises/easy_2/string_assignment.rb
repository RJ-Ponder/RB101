name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
# In the above code, name points to the object 'Bob' and save_name points to the same object.
# name is reassigned to 'Alice', while save_name still points to 'Bob'
# Alice and Bob are displayed.

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
# In the above code, this time name points to 'Bob' and save_name to 'Bob' as well
# But now, the upcase! method mutates the object so save_name and name both point to 'BOB'
# BOB and BOB are displayed.
