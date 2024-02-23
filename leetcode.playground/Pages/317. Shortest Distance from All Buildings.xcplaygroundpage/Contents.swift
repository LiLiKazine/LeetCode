//: [Previous](@previous)

/*
 317. Shortest Distance from All Buildings
 困难
 
 You are given an m x n grid grid of values 0, 1, or 2, where:

 each 0 marks an empty land that you can pass by freely,
 each 1 marks a building that you cannot pass through, and
 each 2 marks an obstacle that you cannot pass through.
 You want to build a house on an empty land that reaches all buildings in the shortest total travel distance. You can only move up, down, left, and right.

 Return the shortest travel distance for such a house. If it is not possible to build such a house according to the above rules, return -1.

 The total travel distance is the sum of the distances between the houses of the friends and the meeting point.

 The distance is calculated using Manhattan Distance, where distance(p1, p2) = |p2.x - p1.x| + |p2.y - p1.y|.

  

 Example 1:


 Input: grid = [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]
 Output: 7
 Explanation: Given three buildings at (0,0), (0,4), (2,2), and an obstacle at (0,2).
 The point (1,2) is an ideal empty land to build a house, as the total travel distance of 3+3+1=7 is minimal.
 So return 7.
 Example 2:

 Input: grid = [[1,0]]
 Output: 1
 Example 3:

 Input: grid = [[1]]
 Output: -1
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] is either 0, 1, or 2.
 There will be at least one building in the grid.
 
 */

import Foundation

class Solution {
    
    let empty = 0
    let building = 1
    let obstacle = 2
    
    let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    
    
    func shortestDistance(_ grid: [[Int]]) -> Int {
        var grid = grid
        var houses = [[Int]]()
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == building {
                    houses.append([i, j])
                }
            }
        }
                        
        var totalDist = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        
        var ans = Int.max
        
        var threshold = empty
        
        for house in houses {
            ans = Int.max
            var queue = [house], steps = 0
            while !queue.isEmpty {
                steps += 1
                var nextQueue = [[Int]]()
                for position in queue {
                    for direction in directions {
                        let x = position[0] + direction[0], y = position[1] + direction[1]
                        if x < 0 || x >= grid.count || y < 0 || y >= grid[x].count || grid[x][y] != threshold {
                            continue
                        }
                        grid[x][y] -= 1
                        totalDist[x][y] += steps
                        nextQueue.append([x, y])
                        ans = min(ans, totalDist[x][y])
                    }
                }
                queue = nextQueue
            }
            threshold -= 1
        }
        if ans == Int.max {
            return -1
        }
        return ans
    }
    
}

//: [Next](@next)
