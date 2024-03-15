//: [Previous](@previous)

/*
 1020. Number of Enclaves
 中等
 You are given an m x n binary matrix grid, where 0 represents a sea cell and 1 represents a land cell.

 A move consists of walking from one land cell to another adjacent (4-directionally) land cell or walking off the boundary of the grid.

 Return the number of land cells in grid for which we cannot walk off the boundary of the grid in any number of moves.

  

 Example 1:


 Input: grid = [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]
 Output: 3
 Explanation: There are three 1s that are enclosed by 0s, and one 1 that is not enclosed because its on the boundary.
 Example 2:


 Input: grid = [[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]
 Output: 0
 Explanation: All 1s are either on the boundary or can reach the boundary.
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 500
 grid[i][j] is either 0 or 1.
 
 */

import Foundation

class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var grid = grid, cnt = 0
        
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        
        func isValid(_ x: Int, _ y: Int) -> Bool {
            if x < 0 || x >= grid.count || y < 0 || y >= grid[x].count {
                return false
            }
            return grid[x][y] == 1
        }
        
        func dfs(_ x: Int, _ y: Int) {
            grid[x][y] = 2
            for direction in directions {
                let x = x + direction[0], y = y + direction[1]
                if isValid(x, y) {
                    dfs(x, y)
                }
            }
        }
        
        for i in 0..<grid.count {
            for j in [0, grid[i].count-1] {
                if grid[i][j] == 1 {
                    dfs(i, j)
                }
            }
        }
        
        for i in [0, grid.count-1] {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    dfs(i, j)
                }
            }
        }
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    cnt += 1
                }
            }
        }
        
        return cnt
    }
}

//: [Next](@next)
