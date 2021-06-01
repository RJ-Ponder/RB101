Side effects are either destructive mutations or outputs

EXAMPLE 3
| Line |        Action       |                Object                |                  Side Effect                  |           Return Value          | Is Return Value Used?                        |
|:----:|:-------------------:|:------------------------------------:|:---------------------------------------------:|:-------------------------------:|----------------------------------------------|
|   1  | method call (map    | outer array                          | none                                          | new array                       | no, but shown on line 6                      |
|  1-3 | block execution     | each sub-array                       | none                                          | nil                             | yes, used by map for transformation          |
|   2  | method call (first) | each sub-array                       | none                                          | element at index 0 of sub-array | yes, used by puts                            |
|   2  | method call (puts)  | element at index 0 or each sub-array | outputs a string representation of an integer | nil                             | yes, used to determine return value of block |

EXAMPLE 4
| Line | Action                | Object                         | Side Effect                | Return Value                        | Is Return Value Used?                                                            |
|------|-----------------------|--------------------------------|----------------------------|-------------------------------------|----------------------------------------------------------------------------------|
| 1    | variable assignment   | array object                   | none                       | the original array                  | no                                                                               |
| 1    | method call (each)    | outer array                    | none                       | the calling object                  | yes, assigned to my_arr                                                          |
| 1-7  | outer block execution | each sub-array                 | none                       | each sub-array                      | no                                                                               |
| 2    | method call (each)    | each sub-array                 | none                       | the calling object (each sub-array) | yes, used to determine the return value of the outer block execution             |
| 2-6  | inner block execution | each element of the sub-array  | none                       | nil                                 | no                                                                               |
| 3    | comparison (>)        | each element of the sub-array  | none                       | boolean                             | yes, used by if conditional                                                      |
| 3-5  | conditional (if)      | result of comparison (boolean) | none                       | nil                                 | yes, used to determine return value of inner block execution                     |
| 4    | method call (puts)    | each element of the sub-array  | outputs the element if > 5 | nil                                 | yes, used to determine return value of conditional statement if condition is met |

EXAMPLE 5
EXAMPLE 6
EXAMPLE 7
EXAMPLE 8
EXAMPLE 9
EXAMPLE 10
