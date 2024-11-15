//: [Previous](@previous)

/*
 1102. Path With Maximum Minimum Value
 中等
 Given an m x n integer matrix grid, return the maximum score of a path starting at (0, 0) and ending at (m - 1, n - 1) moving in the 4 cardinal directions.

 The score of a path is the minimum value in that path.

 For example, the score of the path 8 → 4 → 5 → 9 is 4.
  

 Example 1:


 Input: grid = [[5,4,5],[1,2,6],[7,4,6]]
 Output: 4
 Explanation: The path with the maximum score is highlighted in yellow.
 Example 2:


 Input: grid = [[2,2,1,2,2,2],[1,2,2,2,1,2]]
 Output: 2
 Example 3:


 Input: grid = [[3,4,6,3,4],[0,2,1,1,7],[8,8,3,2,7],[3,2,4,9,8],[4,1,2,0,0],[4,6,5,4,3]]
 Output: 3
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 100
 0 <= grid[i][j] <= 109
 */

import Foundation

class Solution {
    func maximumMinimumPath(_ grid: [[Int]]) -> Int {
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        
        var l = 0, r = grid.map { $0.max()! }.max()!
        
        func check(_ x: Int) -> Bool {
            var visited = Set<[Int]>()
            func dfs(_ i: Int, _ j: Int) -> Bool {
                guard i >= 0, i < grid.count, j >= 0, j < grid[i].count else { return false }
                let score = grid[i][j]
                if score < x {
                    return false
                }
                if i == grid.count - 1, j == grid[i].count - 1 { return true }
                var res = false
                for (di, dj) in directions {
                    if visited.contains([i + di, j + dj]) { continue }
                    visited.insert([i + di, j + dj])
                    res = res || dfs(i + di, j + dj)
                }
                return res
            }
            return dfs(0, 0)
        }
        
        while l <= r {
            let mid = l + (r - l) / 2
            if check(mid) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return r
    }
}

//: [Next](@next)
