//: [Previous](@previous)

/*
 1254. Number of Closed Islands
 中等
 Given a 2D grid consists of 0s (land) and 1s (water).  An island is a maximal 4-directionally connected group of 0s and a closed island is an island totally (all left, top, right, bottom) surrounded by 1s.

 Return the number of closed islands.

  

 Example 1:



 Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
 Output: 2
 Explanation:
 Islands in gray are closed because they are completely surrounded by water (group of 1s).
 Example 2:



 Input: grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
 Output: 1
 Example 3:

 Input: grid = [[1,1,1,1,1,1,1],
                [1,0,0,0,0,0,1],
                [1,0,1,1,1,0,1],
                [1,0,1,0,1,0,1],
                [1,0,1,1,1,0,1],
                [1,0,0,0,0,0,1],
                [1,1,1,1,1,1,1]]
 Output: 2
  

 Constraints:

 1 <= grid.length, grid[0].length <= 100
 0 <= grid[i][j] <=1
 
 */

import Foundation

class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        
        var grid = grid, cnt = 0
        
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        
        func isValid(_ x: Int, _ y: Int) -> Bool {
            if x < 0 || x >= grid.count || y < 0 || y >= grid[x].count {
                return false
            }
            return grid[x][y] == 0
        }
        
        func makeSea(_ x: Int, _ y: Int) {
            grid[x][y] = 1
            for direction in directions {
                let x = x + direction[0], y = y + direction[1]
                if isValid(x, y) {
                    makeSea(x, y)
                }
            }
        }
        
        for i in 0..<grid.count {
            for j in [0, grid[i].count-1] {
                if grid[i][j] == 0 {
                    makeSea(i, j)
                }
            }
        }
        
        for i in [0, grid.count-1] {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    makeSea(i, j)
                }
            }
        }
        
        for i in 1..<grid.count {
            for j in 1..<grid[i].count {
                if grid[i][j] == 0 {
                    cnt += 1
                    makeSea(i, j)
                }
            }
        }
        
        return cnt
    }
}

//: [Next](@next)
