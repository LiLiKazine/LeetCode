//: [Previous](@previous)

/*
 694. Number of Distinct Islands
 中等
 
 You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

 An island is considered to be the same as another if and only if one island can be translated (and not rotated or reflected) to equal the other.

 Return the number of distinct islands.

  

 Example 1:


 Input: grid = [[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]]
 Output: 1
 Example 2:


 Input: grid = [[1,1,0,1,1],[1,0,0,0,0],[0,0,0,0,1],[1,1,0,1,1]]
 Output: 3
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] is either 0 or 1.

 */

import Foundation

class Solution {
    
    var visited = Set<[Int]>()
    
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        
        var ans = Set<String>()
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 0 || visited.contains([i, j]) {
                    continue
                }
                var name = ""
                // guard valid(i, j, grid: grid) else {
                //     continue
                // }
                dfs(i, j, grid: grid, dir: "0", name: &name)
                if name.isEmpty {
                    continue
                }
                ans.insert(name)
                // print(name)
            }
        }
        return ans.count
    }
    
    func dfs(_ i: Int, _ j: Int, grid: [[Int]], dir: String, name: inout String) {
        guard valid(i, j, grid: grid) else {
            return
        }
        visited.insert([i, j])
        
        name += dir
        dfs(i, j + 1, grid: grid, dir: "R", name: &name)
        dfs(i + 1, j, grid: grid, dir: "D", name: &name)
        dfs(i, j - 1, grid: grid, dir: "L", name: &name)
        dfs(i - 1, j, grid: grid, dir: "U", name: &name)
        name += "1"
    }
    
    func valid(_ i: Int, _ j: Int, grid: [[Int]]) -> Bool {
        if visited.contains([i, j]) {
            return false
        }
        return i >= 0 && i < grid.count && j >= 0 && j < grid[i].count && grid[i][j] == 1
    }
}

//: [Next](@next)
