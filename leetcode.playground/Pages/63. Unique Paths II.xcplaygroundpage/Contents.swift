//: [Previous](@previous)

/*
 
 63. Unique Paths II
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 Now consider if some obstacles are added to the grids. How many unique paths would there be?



 An obstacle and empty space is marked as 1 and 0 respectively in the grid.

 Note: m and n will be at most 100.

 Example 1:

 Input:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 Output: 2
 Explanation:
 There is one obstacle in the middle of the 3x3 grid above.
 There are two ways to reach the bottom-right corner:
 1. Right -> Right -> Down -> Down
 2. Down -> Down -> Right -> Right
 
 */

class Solution {
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        if obstacleGrid[0][0] == 1 { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        
        for i in 0..<obstacleGrid.count {
            for j in 0..<obstacleGrid[i].count {
                let able = obstacleGrid[i][j] == 0
                if i == 0 && j == 0 {
                    dp[0][0] = able ? 1 : 0
                } else if i == 0 && able {
                    dp[i][j] = dp[i][j-1]
                }
                else if j == 0 && able {
                    dp[i][j] = dp[i-1][j]
                } else if i > 0 && j > 0 && able {
                    dp[i][j] = dp[i][j-1] + dp[i-1][j]
                }
            }
        }
        return dp.last!.last!
    }
    
}

let input =  [
  [0,0,0],
  [0,1,0],
  [0,0,0]
]
let solution = Solution()
let ans = solution.uniquePathsWithObstacles(input)
ans

//: [Next](@next)
