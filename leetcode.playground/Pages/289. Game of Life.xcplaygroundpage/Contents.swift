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
        alphaReplace(&board)
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == 2 {
                    board[i][j] = 1
                }
                if board[i][j] == 3 {
                    board[i][j] = 0
                }
            }
        }
    }
    
    func alphaReplace(_ board: inout [[Int]]) {
        // 2 0 -> 1, 3 1 -> 0
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                let (live, _) = around(&board, i, j)
                var to: Bool?
                if live < 2 || live > 3 {
                    to = false
                } else if live == 3 {
                    to = true
                }
                if let to = to {
                    change(&board, i, j, to)
                }
            }
        }
    }
    
    func around(_ board: inout [[Int]], _ line: Int, _ row: Int) -> (live: Int, dead: Int) {
        var live = 0, dead = 0
        for i in line-1 ... line+1 {
            for j in row-1 ... row+1 {
                guard i >= 0 && i < board.count &&
                    j >= 0 && j < board[i].count &&
                (i != line || j != row) else {
                        continue
                }
                let val = board[i][j]
                if val == 0 || val == 2 {
                    dead += 1
                }
                if val == 1 || val == 3 {
                    live += 1
                }
            }
        }
        print(live)
        return (live, dead)
    }
    
    func change(_ board: inout [[Int]], _ i: Int, _ j: Int, _ live: Bool) {
        let old = board[i][j]
        switch old {
        case 0:
            board[i][j] = live ? 2 : 0
        case 1:
            board[i][j] = live ? 1 : 3
        default:
            break
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
