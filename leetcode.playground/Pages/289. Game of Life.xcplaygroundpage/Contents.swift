//: [Previous](@previous)

/*
 
 289. Game of Life
 
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.

 Example:

 Input:
 [
   [0,1,0],
   [0,0,1],
   [1,1,1],
   [0,0,0]
 ]
 Output:
 [
   [0,0,0],
   [1,0,1],
   [0,1,1],
   [0,1,0]
 ]
 Follow up:

 Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.
 In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?
 
 */

import Foundation

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1], [-1, -1], [-1, 1], [1, -1], [1, 1]]
        func value(_ i: Int, _ j: Int) -> Int {
            var cnt = 0
            for direction in directions {
                let x = i + direction[0], y = j + direction[1]
                guard 0 <= x && x < board.count && 0 <= y && y < board[x].count else {
                    continue
                }
                if board[x][y] & 0b1 == 1 {
                    cnt += 1
                }
            }
            var val = board[i][j], isLive = val & 0b1 == 1
            if isLive {
                if cnt < 2 || cnt > 3 {
                } else {
                    val += 2
                }
            } else if cnt == 3 {
                val += 2
            }
            return val
        }
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                board[i][j] = value(i, j)
            }
        }
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                board[i][j] = (board[i][j] >> 1)
            }
        }
    }
}

var arr = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
/*
 
 0 1 0
 0 0 1
 1 1 1
 0 0 0
 
 */
let solution = Solution()
solution.gameOfLife(&arr)

arr

//: [Next](@next)
