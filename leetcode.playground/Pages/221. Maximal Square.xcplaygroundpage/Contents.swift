//: [Previous](@previous)

/*
 
 221. Maximal Square
 
 Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

  

 Example 1:


 Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 Output: 4
 Example 2:


 Input: matrix = [["0","1"],["1","0"]]
 Output: 1
 Example 3:

 Input: matrix = [["0"]]
 Output: 0
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 300
 matrix[i][j] is '0' or '1'.
 
 */

import Foundation

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {

        var values: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        var ans = 0
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                let c = matrix[i][j]
                let val = c == Character("1") ? 1 : 0
                if val == 0 {
                    values[i][j] = 0
                }
                else if i == 0 || j == 0 {
                    values[i][j] = 1
                }
                else {
                    values[i][j] = min(values[i][j-1], values[i-1][j], values[i-1][j-1]) + 1
                }
                ans = max(ans, values[i][j])
            }
        }
        
        
        return ans * ans
    }
}

let solution = Solution()
let matrix = [[Character("1"),Character("1")],[Character("1"),Character("1")]]
let ans = solution.maximalSquare(matrix)

//: [Next](@next)
