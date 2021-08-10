=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an 
efficient algorithm, but it's a great exercise for student developers. In this 
exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. 
On each pass, each pair of consecutive elements is compared. If the first of 
the two elements is greater than the second, then the two elements are swapped. 
This process is repeated until a complete pass is made without performing any 
swaps; at that point, the Array is completely sorted.

0: 6 2 7 1 4    Start: compare 6 > 2? Yes
E: 2 6 7 1 4    Exchange
1: 2 6 7 1 4    6 > 7? No (no exchange)
2: 2 6 7 1 4    7 > 1? Yes
E: 2 6 1 7 4    Exchange
3: 2 6 1 7 4    7 > 4? Yes
E: 2 6 1 4 7    Exchange

2	6	1	4	7	2 > 6? No
2	6	1	4	7	6 > 1? Yes
2	1	6	4	7	Exchange
2	1	6	4	7	6 > 4? Yes
2	1	4	6	7	Exchange
2	1	4	6	7	6 > 7? No
2	1	4	6	7	2 > 1? Yes
1	2	4	6	7	Exchange
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	1 > 2? No
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	No swaps; all done; sorted
We can stop iterating the first time we make a pass through the array without 
making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm 
as well as a minor optimization technique, see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using 
the bubble sort algorithm as just described. Note that your sort will be 
"in-place"; that is, you will mutate the Array passed as an argument. You may 
assume that the Array contains at least 2 elements.

Problem
- write the bubble sort algorithm
Data structure
- input: array of integers or array of strings
- output: mutated and sorted array of integers or strings
0: 6 2 7 1 4    Start: compare 6 > 2? Yes
E: 2 6 7 1 4    Exchange
1: 2 6 7 1 4    6 > 7? No (no exchange)
2: 2 6 7 1 4    7 > 1? Yes
E: 2 6 1 7 4    Exchange
3: 2 6 1 7 4    7 > 4? Yes
E: 2 6 1 4 7    Exchange
Algorithm
- set flag to true
- iterate from index 0 to second to last index (0..-2)
- Start by comparing 0 to 1 (use <=>)
  - continue if -1 or 0
  - swap if 1 => array[0], array[1] = array[1], array[0]
    - set flag to false
- then next index (1 to 2)
  - same conditional
- set the above in a loop and only break when flag is true
=end

def bubble_sort!(array)
  loop do
    length = array.length # further exploration implementation
    no_swaps = true
    (0...length - 1).each do |index|
      compare = array[index] <=> array[index + 1]
      if compare == -1 || compare == 0
        next
      else
        array[index], array[index + 1] = array[index + 1], array[index]
        no_swaps = false
      end
    end
    length -= 1 # further exploration implementation
    break if no_swaps == true
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

=begin
Further Exploration
Note that we did not use the optimization suggested on the Wiki page that skips 
looking at tail elements that we know are already sorted. If your solution also 
skipped this optimization, try modifying your solution so it uses that optimization.
=end