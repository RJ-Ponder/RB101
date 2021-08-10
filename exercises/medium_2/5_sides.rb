=begin
A triangle is classified as follows:

equilateral: All 3 sides are of equal length
isosceles: 2 sides are of equal length, while the 3rd is different
scalene: All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must 
be greater than the length of the longest side, and all sides must have lengths 
greater than 0: if either of these conditions is not satisfied, the triangle is 
invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending 
on whether the triangle is equilateral, isosceles, scalene, or invalid.

Problem
- determine the type of triangle
Algorithm
- return :invalid if any of sides are less than 0
- any two sides must be greater than the third (brute force)
  a = side_1 + side_2 > side_3
  b = side_1 + side_3 > side_2
  c = side_2 + side_3 > side_1
- 
  
=end

def triangle(side_1, side_2, side_3)
  return :invalid if side_1 <= 0 || side_2 <= 0 || side_3 <= 0
  a = side_1 + side_2 > side_3
  b = side_1 + side_3 > side_2
  c = side_2 + side_3 > side_1
  return :invalid unless a && b && c
  return :equilateral if side_1 == side_2 && side_2 == side_3
  return :isosceles if side_1 == side_2 || side_1 == side_3 || side_2 == side_3
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid