//: [Previous](@previous)

/*
 542. 01 Matrix
 中等
 Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

 The distance between two adjacent cells is 1.

  

 Example 1:


 Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
 Output: [[0,0,0],[0,1,0],[0,0,0]]
 Example 2:


 Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
 Output: [[0,0,0],[0,1,0],[1,2,1]]
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 104
 1 <= m * n <= 104
 mat[i][j] is either 0 or 1.
 There is at least one 0 in mat.
 
 */

import Foundation

class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var q = [[Int]]()
        for i in 0..<mat.count {
            for j in 0..<mat.count {
                if mat[i][j] == 0 {
                    q.append([i, j])
                }
            }
        }
        
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        
        
        var ans = Array(repeating: Array(repeating: -1, count: mat[0].count), count: mat.count)
        
        func isValid(_ x: Int, _ y : Int) -> Bool {
            if x < 0 || x >= mat.count || y < 0 || y >= mat[0].count {
                return false
            }
            return ans[x][y] < 0
        }
        
        var cnt = 0
        for p in q {
            ans[p[0]][p[1]] = cnt
        }
        cnt += 1
        while q.count > 0 {
            var nexts = [[Int]]()
            while q.count > 0 {
                let p = q.removeFirst()
                for direction in directions {
                    let x = p[0] + direction[0], y = p[1] + direction[1]
                    if isValid(x, y) {
                        ans[x][y] = cnt
                        nexts.append([x, y])
                    }
                }
            }
            cnt += 1
            q = nexts
        }
        return ans
    }
}

//: [Next](@next)
