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
    
    struct Key: Hashable {
        var x: Int
        var y: Int
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }
    
    var cache: [Key: Int] = [:]
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        
        let m = obstacleGrid.count, n = obstacleGrid.first?.count ?? 0
        
        guard m > 0 && n > 0 else {
            return 0
        }
        
        if obstacleGrid[m-1][n-1] == 1 {
            return 0
        }
        
        if m == 1 && n == 1 {
            return 1
        }
        cache[Key(m-1, n-1)] = 1
        return dp(obstacleGrid, 0, 0)
    }
    
    func dp(_ obstacleGrid: [[Int]], _ m: Int, _ n: Int) -> Int {
        
        guard m < obstacleGrid.count && n < obstacleGrid[0].count && obstacleGrid[m][n] != 1 else {
            return 0
        }

        let key1 = Key(m+1, n)
        if cache[key1] == nil {
            cache[key1] = dp(obstacleGrid, m+1, n)
        }
        
        let key2 = Key(m, n+1)
        if cache[key2] == nil {
            cache[key2] = dp(obstacleGrid, m, n+1)
        }
        
        return cache[key1]! + cache[key2]!
        
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
