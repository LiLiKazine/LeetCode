//: [Previous](@previous)

/*
 1198. Find Smallest Common Element in All Rows
 
 Given an m x n matrix mat where every row is sorted in strictly increasing order, return the smallest common element in all rows.

 If there is no common element, return -1.

  

 Example 1:

 Input: mat = [[1,2,3,4,5],[2,4,5,8,10],[3,5,7,9,11],[1,3,5,7,9]]
 Output: 5
 Example 2:

 Input: mat = [[1,2,3],[2,3,4],[2,3,5]]
 Output: 2
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 500
 1 <= mat[i][j] <= 104
 mat[i] is sorted in strictly increasing order.
 
 */

import Foundation

class Solution {
    func smallestCommonElement(_ mat: [[Int]]) -> Int {
        if mat.count == 1 {
            return mat[0][0]
        }
        var map = [Int: Int]()
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                let v = mat[i][j]
                map[v] = (map[v] ?? 0) + 1
            }
        }
        
        var ans = -1
        for (k, v) in map {
            if v == mat.count {
                if ans < 0 {
                    ans = k
                } else {
                    ans = min(ans, k)
                }
            }
        }
        return ans
    }
}

//: [Next](@next)
