//: [Previous](@previous)

/*
 37. Sudoku Solver
 
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 Empty cells are indicated by the character '.'.


 A sudoku puzzle...


 ...and its solution numbers marked in red.

 Note:

 The given board contain only digits 1-9 and the character '.'.
 You may assume that the given Sudoku puzzle will have a single unique solution.
 The given board size is always 9x9.
 
 */

import Foundation

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                let nums = avaliable(i, j, board)
                for i in nums {
                    
                }
            }
        }
    }
    
    
    
    func avaliable(_ x: Int, _ y: Int, _ board: [[Character]]) -> [Character] {
        var nums = [Character]("123456789")
        for i in 0..<9 {
            nums.removeAll(where: { $0 == board[i][y] })
            nums.removeAll(where: { $0 == board[x][i] })
        }
        let sec = y/3*3 + x/3%3
        let sx = sec % 3 * 3
        let sy = sec / 3 * 3
        for i in sx..<sx+3 {
            for j in sy..<sy+3 {
                nums.removeAll(where: { $0 == board[i][j] })
            }
        }
        return nums
    }
}

//: [Next](@next)
