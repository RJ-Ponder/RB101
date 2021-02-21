array = [1, 2, 3]

p(array.map) do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end                                 #  => <Enumerator: [1, 2, 3]:map>

p(array.map { |num| num + 1 })      # [2, 3, 4]
                                    # => [2, 3, 4]
                                    
(1..10)                  .tap {|x| puts "original: #{x}" }
  .to_a                  .tap {|x| puts "array:    #{x}" }
  .select {|x| x.even? } .tap {|x| puts "evens:    #{x}" }
  .map {|x| x*x }        .tap {|x| puts "squares:  #{x}" }
  
(1..10)                 .tap { |x| p x }   # 1..10
.to_a                  .tap { |x| p x }   # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
.select {|x| x.even? } .tap { |x| p x }   # [2, 4, 6, 8, 10]
.map {|x| x*x }        .tap { |x| p x }   # [4, 16, 36, 64, 100]

#tap, shown above is used to tap into method chains to perform operations on intermediate results in the chain
# it is an Object instance method