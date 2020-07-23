//: [Previous](@previous)

/*
 
 64. Minimum Path Sum
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.

 Example:

 Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        let lines = grid.count, rows = grid[0].count
        var dp: [Key: Int] = [:]
        dp[Key(0, 0)] = grid[0][0]
        for i in 1..<lines {
            dp[Key(i, 0)] = dp[Key(i-1, 0)]! + grid[i][0]
        }
        
        for i in 1..<rows {
            dp[Key(0, i)] = dp[Key(0, i-1)]! + grid[0][i]
        }
        
        for i in 1..<lines {
            for j in 1..<rows {
                let top = dp[Key(i-1, j)]!
                let left = dp[Key(i, j-1)]!
                dp[Key(i, j)] = min(top, left) + grid[i][j]
            }
        }
        return dp[Key(lines-1, rows-1)]!
    }
    
    struct Key: Hashable {
        var x: Int
        var y: Int
        
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }
}

let solution = Solution()
let ans = solution.minPathSum([[1,3,1],[1,5,1],[4,2,1]])
ans

//: [Next](@next)
