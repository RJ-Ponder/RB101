=begin
As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

1  5  8
4  7  2
3  9  6
can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8
A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

3  4  1
9  7  5
is:

9  3
7  4
5  1
Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

Study an example
1  5  8   00 01 02 # first row becomes last column
4  7  2   10 11 12 # middle row becomes middle column
3  9  6   20 21 22 # last row becomes first column

[[1, 5, 8], [4, 7, 2], [3, 9, 6]]
[[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# 
3  4  1   00 01 02
9  7  5   10 11 12
6  2  8   20 21 22

3  4  1 # first row becomes last column
9  7  5 # last row becomes first column

[[3, 4, 1], [9, 7, 5]]
[[9, 3], [7, 4], [5, 1]]

iterate through the last array and push each element into the first 3
iterate through the second to last array and push each element

9  3
7  4
5  1

To rotate 90 degrees:
1: 00 -> 00 -> 02
5: 01 -> 10 -> 12
8: 02 -> 20 -> 22
4: 10 -> 01 -> 01
7: 11 -> 11 -> 11
2: 12 -> 21 -> 21
3: 20 -> 02 -> 00
9: 21 -> 12 -> 10
6: 22 -> 22 -> 20

First swap the row and column
Then swap column first with last, second first, second last, etc

# row number is mirrored with column number
# column number becomes row number

[[1, 5, 8], [4, 7, 2], [3, 9, 6]]
[[3, 4, 1], [9, 7, 5], [6, 2, 8]]

[[3, 4, 1], [9, 7, 5]]
[[9, 3], [7, 4], [5, 1]]

iterate through the last array and push each element into the first 3
iterate through the second to last array and push each element
=end

def rotate90(matrix)
  new_matrix = []
  matrix[0].size.times { new_matrix << [] }
  matrix.reverse.each do |row|
    new_matrix.each_with_index do |col, index|
      col << row[index]
    end
  end
  new_matrix
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

=begin
Further Exploration
Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?

write something that will call the previous method multiple times
=end