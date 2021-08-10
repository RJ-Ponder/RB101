=begin
Transpose 3x3
A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

Copy Code
1  5  8
4  7  2
3  9  6
can be described by the Array of Arrays:

Copy Code
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

Copy Code
1  4  3
5  7  9
8  2  6
Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.


# brute force method
# def transpose(matrix)
#   new_matrix = [[], [], []]
#   new_matrix[0][0] = matrix[0][0]
#   new_matrix[0][1] = matrix[1][0]
#   new_matrix[0][2] = matrix[2][0]
#   new_matrix[1][0] = matrix[0][1]
#   new_matrix[1][1] = matrix[1][1]
#   new_matrix[1][2] = matrix[2][1]
#   new_matrix[2][0] = matrix[0][2]
#   new_matrix[2][1] = matrix[1][2]
#   new_matrix[2][2] = matrix[2][2]
#   new_matrix
# end

# iterative method (could dynamically create the new matrix and range based on size to transpose size n matrices)
def transpose(matrix)
  new_matrix = [[], [], []]
  (0..2).each do |index1|
    (0..2).each do |index2|
      new_matrix[index1][index2] = matrix[index2][index1]
    end
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
=end
=begin
Further Exploration
Write a transpose! method that transposes a matrix in place. The obvious solution is to reuse transpose from above, then copy the results back into the array specified by the argument. For this method, don't use this approach; write a method from scratch that does the in-place transpose.
=end

# brute force method
# def transpose!(matrix)
#   matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
#   matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
#   matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]
#   matrix
# end

# iterative method (it would be pretty easy to make this dynamic too)
def transpose!(matrix)
  (0..2).each do |i1|
    (i1..2).each do |i2|
      matrix[i1][i2], matrix[i2][i1] = matrix[i2][i1], matrix[i1][i2]
    end
  end
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]