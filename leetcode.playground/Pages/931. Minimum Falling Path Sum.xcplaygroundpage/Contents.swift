//: [Previous](@previous)

/*
 931. Minimum Falling Path Sum
 
 Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix.

 A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).

  

 Example 1:


 Input: matrix = [[2,1,3],[6,5,4],[7,8,9]]
 Output: 13
 Explanation: There are two falling paths with a minimum sum as shown.
 Example 2:


 Input: matrix = [[-19,57],[-40,-5]]
 Output: -59
 Explanation: The falling path with a minimum sum is shown.
  

 Constraints:

 n == matrix.length == matrix[i].length
 1 <= n <= 100
 -100 <= matrix[i][j] <= 100
 
 */

import Foundation

class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix[0]
        for i in 1..<matrix.count {
            var tmp = Array(repeating: 0, count: matrix[i].count)
            for j in 0..<matrix[i].count {
                let val = matrix[i][j]
                if j == 0 {
                    tmp[j] = min(dp[j] + val, dp[j+1] + val)
                } else if j == matrix[i].count - 1 {
                    tmp[j] = min(dp[j-1] + val, dp[j] + val)
                } else {
                    tmp[j] = min(dp[j-1] + val, dp[j] + val, dp[j+1] + val)
                }
            }
            dp = tmp
        }
        return dp.reduce(Int.max) { partialResult, val in
            return partialResult < val ? partialResult : val
        }
    }
}

//: [Next](@next)
