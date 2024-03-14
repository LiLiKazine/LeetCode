//: [Previous](@previous)

/*
 1091. Shortest Path in Binary Matrix
 中等
 Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.

 A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:

 All the visited cells of the path are 0.
 All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
 The length of a clear path is the number of visited cells of this path.

  

 Example 1:


 Input: grid = [[0,1],[1,0]]
 Output: 2
 Example 2:


 Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
 Output: 4
 Example 3:

 Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
 Output: -1
  

 Constraints:

 n == grid.length
 n == grid[i].length
 1 <= n <= 100
 grid[i][j] is 0 or 1
 
 */

import Foundation

class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        if grid.first?.first != 0 || grid.last?.last != 0 {
            return -1
        }
        
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        visited[0][0] = true
        
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1], [-1, -1], [1, 1], [1, -1], [-1, 1]]
        func isValid(_ x: Int, _ y : Int) -> Bool {
            if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count {
                return false
            }
            return grid[x][y] == 0 && !visited[x][y]
        }
        
        var q = [[0, 0]], cnt = 1
        
        while q.count > 0 {
            var nexts = [[Int]]()
            while q.count > 0 {
                let p = q.removeFirst()
                if p == [grid.count - 1, grid[0].count - 1] {
                    return cnt
                }
                for direction in directions {
                    let x = p[0] + direction[0], y = p[1] + direction[1]
                    if isValid(x, y) {
                        nexts.append([x, y])
                        visited[x][y] = true
                    }
                }
            }
            q = nexts
            cnt += 1
        }
        return -1
    }
}

//: [Next](@next)
