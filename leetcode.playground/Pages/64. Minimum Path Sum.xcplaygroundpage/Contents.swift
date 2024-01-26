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
       var grid = grid
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if i == 0 && j == 0 {
                    continue
                } else if i == 0 {
                    grid[i][j] += grid[i][j-1]
                } else if j == 0 {
                    grid[i][j] += grid[i-1][j]
                } else {
                    grid[i][j] += min(grid[i-1][j], grid[i][j-1])
                }
            }
        }
        
        return grid.last!.last!
    }
}

let solution = Solution()
let ans = solution.minPathSum([[1,3,1],[1,5,1],[4,2,1]])
ans

//: [Next](@next)
