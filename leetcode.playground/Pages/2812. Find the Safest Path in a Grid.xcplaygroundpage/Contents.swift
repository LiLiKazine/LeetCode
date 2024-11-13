//: [Previous](@previous)

/*
 2812. Find the Safest Path in a Grid
 中等
 You are given a 0-indexed 2D matrix grid of size n x n, where (r, c) represents:

 A cell containing a thief if grid[r][c] = 1
 An empty cell if grid[r][c] = 0
 You are initially positioned at cell (0, 0). In one move, you can move to any adjacent cell in the grid, including cells containing thieves.

 The safeness factor of a path on the grid is defined as the minimum manhattan distance from any cell in the path to any thief in the grid.

 Return the maximum safeness factor of all paths leading to cell (n - 1, n - 1).

 An adjacent cell of cell (r, c), is one of the cells (r, c + 1), (r, c - 1), (r + 1, c) and (r - 1, c) if it exists.

 The Manhattan distance between two cells (a, b) and (x, y) is equal to |a - x| + |b - y|, where |val| denotes the absolute value of val.

  

 Example 1:


 Input: grid = [[1,0,0],[0,0,0],[0,0,1]]
 Output: 0
 Explanation: All paths from (0, 0) to (n - 1, n - 1) go through the thieves in cells (0, 0) and (n - 1, n - 1).
 Example 2:


 Input: grid = [[0,0,1],[0,0,0],[0,0,0]]
 Output: 2
 Explanation: The path depicted in the picture above has a safeness factor of 2 since:
 - The closest cell of the path to the thief at cell (0, 2) is cell (0, 0). The distance between them is | 0 - 0 | + | 0 - 2 | = 2.
 It can be shown that there are no other paths with a higher safeness factor.
 Example 3:


 Input: grid = [[0,0,0,1],[0,0,0,0],[0,0,0,0],[1,0,0,0]]
 Output: 2
 Explanation: The path depicted in the picture above has a safeness factor of 2 since:
 - The closest cell of the path to the thief at cell (0, 3) is cell (1, 2). The distance between them is | 0 - 1 | + | 3 - 2 | = 2.
 - The closest cell of the path to the thief at cell (3, 0) is cell (3, 2). The distance between them is | 3 - 3 | + | 0 - 2 | = 2.
 It can be shown that there are no other paths with a higher safeness factor.
  

 Constraints:

 1 <= grid.length == n <= 400
 grid[i].length == n
 grid[i][j] is either 0 or 1.
 There is at least one thief in the grid.
 */

import Foundation

class Solution {
    func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
        
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        let n = grid.count
        var l = 0, r = (n - 1) * 2
        
        var g = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        var q = [(Int, Int)]()
        for i in 0..<n {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    q.append((i, j))
                    g[i][j] = 0
                }
            }
        }
        var dist = 1
        while !q.isEmpty {
            var tmp = [(Int, Int)]()
            for p in q {
                let (i, j) = p
                for (dx, dy) in directions {
                    let x = i + dx, y = j + dy
                    if x >= 0 && x < n && y >= 0 && y < n {
                        if dist < g[x][y] {
                            g[x][y] = dist
                            tmp.append((x, y))
                        }
                        
                    }
                }
            }
            q = tmp
            dist += 1
        }
        
        func check(_ x: Int) -> Bool {
            var visited = Set<[Int]>()
            func dfs(_ i: Int, _ j: Int) -> Bool {
                if i == n - 1 && j == n - 1 {
                    return true
                }
                if visited.contains([i, j]) {
                    return false
                }
                visited.insert([i, j])
                var res = false
                for direction in directions {
                    let ni = i + direction.0, nj = j + direction.1
                    if ni >= 0 && ni < n && nj >= 0 && nj < n && g[ni][nj] >= x {
                        res = res || dfs(ni, nj)
                    }
                }
                return res
            }
            return g[0][0] >= x && dfs(0, 0)
        }
        
        while l <= r {
            let mid = l + (r - l) / 2
            if check(mid) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return max(0, r)
    }
}

//: [Next](@next)
