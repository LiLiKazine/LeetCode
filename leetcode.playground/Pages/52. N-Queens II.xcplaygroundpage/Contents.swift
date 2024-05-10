//: [Previous](@previous)

/*
 52. N-Queens II
 困难
 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return the number of distinct solutions to the n-queens puzzle.

  

 Example 1:


 Input: n = 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown.
 Example 2:

 Input: n = 1
 Output: 1
  

 Constraints:

 1 <= n <= 9
 */

import Foundation

class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var ans = 0
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        var colomns = Set<Int>()
        var diagonal1 = Set<Int>()
        var diagonal2 = Set<Int>()
        
        func backTracing(row: Int) {
            if row == n {
                ans += 1
            } else {
                for col in 0..<n {
                    let d1 = row - col, d2 = row + col
                    if colomns.contains(col) || diagonal1.contains(d1) || diagonal2.contains(d2) {
                        continue
                    }
                    colomns.insert(col)
                    diagonal1.insert(d1)
                    diagonal2.insert(d2)
                    board[row][col] = "Q"
                    backTracing(row: row + 1)
                    colomns.remove(col)
                    diagonal1.remove(d1)
                    diagonal2.remove(d2)
                    board[row][col] = "."
                }
            }
        }
        backTracing(row: 0)
        return ans
    }
}

//: [Next](@next)
