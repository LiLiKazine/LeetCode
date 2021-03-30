//: [Previous](@previous)

/*
 
 74. Search a 2D Matrix
 
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
  

 Example 1:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 Example 2:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104
 
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix.first?.count ?? 0
        guard m > 0 && n > 0 else {
            return false
        }
        var head = 0, tail = m - 1
        while head < tail {
            let mid = (head + tail) / 2
            if matrix[mid][0] > target {
                tail = mid - 1
            } else if mid == m - 1 || matrix[mid + 1][0] > target {
                head = mid
                break
            } else {
                head = mid + 1
            }
        }
        let row = head
        head = 0
        tail = n - 1
        while head < tail {
            let mid = (head + tail) / 2
            if matrix[row][mid] < target {
                head = mid + 1
            } else {
                tail = mid
            }
        }
        return matrix[row][head] == target
    }
}

//let matrix = [[1],[3]], target = 3
//let matrix = [[1,1]], target = 1
let matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
//let matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
let solution = Solution()
let ans = solution.searchMatrix(matrix, target)
ans

//: [Next](@next)
