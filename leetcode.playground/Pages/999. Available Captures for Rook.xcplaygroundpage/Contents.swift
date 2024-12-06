//: [Previous](@previous)

/*
 999. Available Captures for Rook
 简单
 You are given an 8 x 8 matrix representing a chessboard. There is exactly one white rook represented by 'R', some number of white bishops 'B', and some number of black pawns 'p'. Empty squares are represented by '.'.

 A rook can move any number of squares horizontally or vertically (up, down, left, right) until it reaches another piece or the edge of the board. A rook is attacking a pawn if it can move to the pawn's square in one move.

 Note: A rook cannot move through other pieces, such as bishops or pawns. This means a rook cannot attack a pawn if there is another piece blocking the path.

 Return the number of pawns the white rook is attacking.

  

 Example 1:


 Input: board = [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]

 Output: 3

 Explanation:

 In this example, the rook is attacking all the pawns.

 Example 2:


 Input: board = [[".",".",".",".",".",".","."],[".","p","p","p","p","p",".","."],[".","p","p","B","p","p",".","."],[".","p","B","R","B","p",".","."],[".","p","p","B","p","p",".","."],[".","p","p","p","p","p",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]

 Output: 0

 Explanation:

 The bishops are blocking the rook from attacking any of the pawns.

 Example 3:


 Input: board = [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","p",".",".",".","."],["p","p",".","R",".","p","B","."],[".",".",".",".",".",".",".","."],[".",".",".","B",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."]]

 Output: 3

 Explanation:

 The rook is attacking the pawns at positions b5, d6, and f5.

  

 Constraints:

 board.length == 8
 board[i].length == 8
 board[i][j] is either 'R', '.', 'B', or 'p'
 There is exactly one cell with board[i][j] == 'R'
 */

import Foundation

class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        let r = board.count, c = board[0].count
        
        func capture(_ i: Int, _ j: Int, _ board: [[Character]]) -> Int {
            var res = 0
            for x in stride(from: i, through: 0, by: -1) {
                if board[x][j] == Character("p") {
                    res += 1
                    break
                }
                if board[x][j] == Character("B") {
                    break
                }
            }
            for x in i..<r {
                if board[x][j] == Character("p") {
                    res += 1
                    break
                }
                if board[x][j] == Character("B") {
                    break
                }
            }
            
            for y in stride(from: j, through: 0, by: -1) {
                if board[i][y] == Character("p") {
                    res += 1
                    break
                }
                if board[i][y] == Character("B") {
                    break
                }
            }
            for y in j..<c {
                if board[i][y] == Character("p") {
                    res += 1
                    break
                }
                if board[i][y] == Character("B") {
                    break
                }
            }
            return res
        }
        
        for i in 0..<r {
            for j in 0..<c {
                if board[i][j] == Character("R") {
                    return capture(i, j, board)
                }
            }
        }
        return 0
    }
}

//: [Next](@next)
