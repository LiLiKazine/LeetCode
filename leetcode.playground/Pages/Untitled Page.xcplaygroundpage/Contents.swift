//: [Previous](@previous)

/*
 311. Sparse Matrix Multiplication
 
 Given two sparse matrices mat1 of size m x k and mat2 of size k x n, return the result of mat1 x mat2. You may assume that multiplication is always possible.

  

 Example 1:


 Input: mat1 = [[1,0,0],[-1,0,3]], mat2 = [[7,0,0],[0,0,0],[0,0,1]]
 Output: [[7,0,0],[-7,0,3]]
 Example 2:

 Input: mat1 = [[0]], mat2 = [[0]]
 Output: [[0]]
  

 Constraints:

 m == mat1.length
 k == mat1[i].length == mat2.length
 n == mat2[i].length
 1 <= m, n, k <= 100
 -100 <= mat1[i][j], mat2[i][j] <= 100
 
 */

import Foundation

class Solution {
    func multiply(_ mat1: [[Int]], _ mat2: [[Int]]) -> [[Int]] {
        let r = mat1.count, c = mat2[0].count
        
        var ans = Array(repeating: Array(repeating: 0, count: c), count: r)
        for i in 0..<r {
            let arr1 = mat1[i]
            for j in 0..<c {
                for k in 0..<mat2.count {
                    ans[i][j] += arr1[k] * mat2[k][j]
                }
            }
        }
        
        return ans
    }
}

//: [Next](@next)
