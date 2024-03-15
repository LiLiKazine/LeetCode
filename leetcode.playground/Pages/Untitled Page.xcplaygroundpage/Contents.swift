//: [Previous](@previous)

/*
 695. Max Area of Island
 中等
 You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 The area of an island is the number of cells with a value 1 in the island.

 Return the maximum area of an island in grid. If there is no island, return 0.

  

 Example 1:


 Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
 Output: 6
 Explanation: The answer is not 11, because the island must be connected 4-directionally.
 Example 2:

 Input: grid = [[0,0,0,0,0,0,0,0]]
 Output: 0
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] is either 0 or 1.
 */

import Foundation

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid, ans = 0
        
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        
        func isValid(_ x: Int, _ y: Int) -> Bool {
            if x < 0 || x >= grid.count || y < 0 || y >= grid[x].count {
                return false
            }
            return grid[x][y] == 1
        }
        
        func dfs(_ x: Int, _ y: Int) -> Int {
            grid[x][y] = 0
            var area = 1
            for direction in directions {
                let x = x + direction[0], y = y + direction[1]
                if isValid(x, y) {
                    area += dfs(x, y)
                }
            }
            return area
        }
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    let area = dfs(i, j)
                    ans = max(ans, area)
                }
            }
        }
        
        return ans
    }
}

//: [Next](@next)
