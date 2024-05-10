//: [Previous](@previous)

/*
 51. N-Queens
 困难
 The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.

  

 Example 1:


 Input: n = 4
 Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above
 Example 2:

 Input: n = 1
 Output: [["Q"]]
  

 Constraints:

 1 <= n <= 9

 */

import Foundation

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {

        var ans = [[String]]()
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        var colomns = Set<Int>()
        var diagonal1 = Set<Int>()
        var diagonal2 = Set<Int>()
        
        func backTracing(row: Int) {
            if row == n {
                ans.append(board.map { $0.joined() })
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
