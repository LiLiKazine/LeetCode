//: [Previous](@previous)

/*
 2713. Maximum Strictly Increasing Cells in a Matrix
 困难
 Given a 1-indexed m x n integer matrix mat, you can select any cell in the matrix as your starting cell.

 From the starting cell, you can move to any other cell in the same row or column, but only if the value of the destination cell is strictly greater than the value of the current cell. You can repeat this process as many times as possible, moving from cell to cell until you can no longer make any moves.

 Your task is to find the maximum number of cells that you can visit in the matrix by starting from some cell.

 Return an integer denoting the maximum number of cells that can be visited.

  

 Example 1:



 Input: mat = [[3,1],[3,4]]
 Output: 2
 Explanation: The image shows how we can visit 2 cells starting from row 1, column 2. It can be shown that we cannot visit more than 2 cells no matter where we start from, so the answer is 2.
 Example 2:



 Input: mat = [[1,1],[1,1]]
 Output: 1
 Explanation: Since the cells must be strictly increasing, we can only visit one cell in this example.
 Example 3:



 Input: mat = [[3,1,6],[-9,5,7]]
 Output: 4
 Explanation: The image above shows how we can visit 4 cells starting from row 2, column 1. It can be shown that we cannot visit more than 4 cells no matter where we start from, so the answer is 4.
  

 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 105
 1 <= m * n <= 105
 -105 <= mat[i][j] <= 105
 
 */

import Foundation

class Solution {
    func maxIncreasingCells(_ mat: [[Int]]) -> Int {
        let m = mat.count, n = mat[0].count
        var mp = [Int: [[Int]]]()
        var row = Array(repeating: 0, count: m)
        var col = Array(repeating: 0, count: n)
        
        for i in 0..<m {
            for j in 0..<n {
                let val = mat[i][j]
                mp[val, default: []].append([i, j])
            }
        }
        
        let keys = mp.keys.sorted(by: >)
        for key in keys {
            let pos = mp[key]!
            var res = [Int]()
            for arr in pos {
                res.append(max(row[arr[0]], col[arr[1]]) + 1)
            }
            for (i, arr) in pos.enumerated() {
                let d = res[i]
                row[arr[0]] = max(row[arr[0]], d)
                col[arr[1]] = max(col[arr[1]], d)
            }
        }
        return row.max()!
    }
}

/*
class Solution {
    
    var ans: Int = 0
    var record = [[Int]]()
    
    func maxIncreasingCells(_ mat: [[Int]]) -> Int {
        record = Array(repeating: Array(repeating: 0, count: mat[0].count), count: mat.count)
        var ans = 0
        for x in 0..<mat.count {
            for y in 0..<mat[x].count {
                let res = maxIncreasingCells(mat, x: x, y: y, cnt: 1)
                ans = max(ans, res)
            }
        }
        return ans
    }
    
    func maxIncreasingCells(_ mat: [[Int]], x: Int, y: Int, cnt: Int) -> Int {
        if record[x][y] > 0 {
            return cnt + record[x][y]
        }
        var ans = cnt
        let val = mat[x][y]
        for (i, n) in mat[x].enumerated() {
            if val < n {
                ans = max(ans, maxIncreasingCells(mat, x: x, y: i, cnt: cnt + 1))

            }
        }
        
        for i in 0..<mat.count {
            let n = mat[i][y]
            if val < n {
                ans = max(ans, maxIncreasingCells(mat, x: i, y: y, cnt: cnt + 1))
            }
        }
        record[x][y] = max(record[x][y], ans - cnt)
        return ans
    }
}
*/

//: [Next](@next)
