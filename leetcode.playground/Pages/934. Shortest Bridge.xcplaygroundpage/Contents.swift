//: [Previous](@previous)

/*
 934. Shortest Bridge
 中等
 You are given an n x n binary matrix grid where 1 represents land and 0 represents water.

 An island is a 4-directionally connected group of 1's not connected to any other 1's. There are exactly two islands in grid.

 You may change 0's to 1's to connect the two islands to form one island.

 Return the smallest number of 0's you must flip to connect the two islands.

  

 Example 1:

 Input: grid = [[0,1],[1,0]]
 Output: 1
 Example 2:

 Input: grid = [[0,1,0],[0,0,0],[0,0,1]]
 Output: 2
 Example 3:

 Input: grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
 Output: 1

 Constraints:

 n == grid.length == grid[i].length
 2 <= n <= 100
 grid[i][j] is either 0 or 1.
 There are exactly two islands in grid.
 
 */

import Foundation

class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        var grid = grid
                
        let initailIsland = {
            for i in 0..<grid.count {
                for j in 0..<grid[i].count {
                    if grid[i][j] == 1 {
                        return [i, j]
                    }
                }
            }
            return []
        }()
        
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        
        var q = [[Int]]()
        
        func dfs(_ island: [Int]) {
            q.append(island)
            grid[island[0]][island[1]] = -1
            for direction in directions {
                let x = island[0] + direction[0], y = island[1] + direction[1]
                if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count || grid[x][y] == -1 || grid[x][y] != 1 {
                    continue
                }
                dfs([x, y])
            }
        }
        
        dfs(initailIsland)
        var ans = 0
        while q.count > 0 {
            var nexts = [[Int]]()
            while q.count > 0 {
                let island = q.removeFirst()
                for direction in directions {
                    let x = island[0] + direction[0], y = island[1] + direction[1]
                    if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count || grid[x][y] == -1 {
                        continue
                    }
                    if grid[x][y] == 1 {
                        return ans
                    }
                    grid[x][y] = -1
                    nexts.append([x, y])
                }
            }
            ans += 1
            q = nexts
        }
        
        return -1
    }
}

//: [Next](@next)
