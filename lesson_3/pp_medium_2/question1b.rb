def fun_with_ids
  b_outer = "forty two"

  b_outer_id = b_outer.object_id

  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts

  1.times do
    b_outer_inner_id = b_outer.object_id

    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts

    b_outer = "thirty three"

    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts

    b_inner = b_outer

    b_inner_id = b_inner.object_id

    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts
  end

  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts

  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

fun_with_ids
