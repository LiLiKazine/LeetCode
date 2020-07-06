//: [Previous](@previous)

/*
 
 62. Unique Paths
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?


 Above is a 7 x 3 grid. How many possible unique paths are there?

  

 Example 1:

 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 Example 2:

 Input: m = 7, n = 3
 Output: 28
  

 Constraints:

 1 <= m, n <= 100
 It's guaranteed that the answer will be less than or equal to 2 * 10 ^ 9.
 
 */

import Foundation

class Solution {
    
    struct Key: Hashable {
        var x: Int
        var y: Int
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }
    
    var cache: [Key: Int] = [:]
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            let k = Key(m, n)
            cache[k] = 1
            return cache[k]!
        }
        let k1 = Key(m-1, n)
        if cache[k1] == nil {
            cache[k1] = uniquePaths(m-1, n)
        }
        let k2 = Key(m, n-1)
        if cache[k2] == nil {
            cache[k2] = uniquePaths(m, n-1)
        }
        return cache[k1]! + cache[k2]!
    }
}

let solution = Solution()
let ans = solution.uniquePaths(23, 12)

//: [Next](@next)
