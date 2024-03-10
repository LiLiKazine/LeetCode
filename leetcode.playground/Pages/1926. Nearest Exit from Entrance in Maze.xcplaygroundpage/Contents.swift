//: [Previous](@previous)

/*

 1926. Nearest Exit from Entrance in Maze
 中等
 You are given an m x n matrix maze (0-indexed) with empty cells (represented as '.') and walls (represented as '+'). You are also given the entrance of the maze, where entrance = [entrancerow, entrancecol] denotes the row and column of the cell you are initially standing at.

 In one step, you can move one cell up, down, left, or right. You cannot step into a cell with a wall, and you cannot step outside the maze. Your goal is to find the nearest exit from the entrance. An exit is defined as an empty cell that is at the border of the maze. The entrance does not count as an exit.

 Return the number of steps in the shortest path from the entrance to the nearest exit, or -1 if no such path exists.

  

 Example 1:


 Input: maze = [["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], entrance = [1,2]
 Output: 1
 Explanation: There are 3 exits in this maze at [1,0], [0,2], and [2,3].
 Initially, you are at the entrance cell [1,2].
 - You can reach [1,0] by moving 2 steps left.
 - You can reach [0,2] by moving 1 step up.
 It is impossible to reach [2,3] from the entrance.
 Thus, the nearest exit is [0,2], which is 1 step away.
 Example 2:


 Input: maze = [["+","+","+"],[".",".","."],["+","+","+"]], entrance = [1,0]
 Output: 2
 Explanation: There is 1 exit in this maze at [1,2].
 [1,0] does not count as an exit since it is the entrance cell.
 Initially, you are at the entrance cell [1,0].
 - You can reach [1,2] by moving 2 steps right.
 Thus, the nearest exit is [1,2], which is 2 steps away.
 Example 3:


 Input: maze = [[".","+"]], entrance = [0,0]
 Output: -1
 Explanation: There are no exits in this maze.
  

 Constraints:

 maze.length == m
 maze[i].length == n
 1 <= m, n <= 100
 maze[i][j] is either '.' or '+'.
 entrance.length == 2
 0 <= entrancerow < m
 0 <= entrancecol < n
 entrance will always be an empty cell.
 
 */

import Foundation

class Solution {
    
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]

        var visited = Array(repeating: Array(repeating: false, count: maze[0].count), count: maze.count)
        
        visited[entrance[0]][entrance[1]] = true
        var q = [entrance], ans = 0
        
        func isValid(_ x: Int, y: Int) -> Bool {
            if x < 0 || x >= maze.count || y < 0 || y >= maze[0].count || visited[x][y] {
                return false
            }
            if maze[x][y] == Character("+") {
                return false
            }
            return true
        }
        while q.count > 0 {
            var nexts = [[Int]]()
            while q.count > 0 {
                let point = q.removeFirst()
                let x = point[0], y = point[1]
                if (x == 0 || y == 0 || x == maze.count - 1 || y == maze[0].count - 1) && ans > 0 {
                    return ans
                }
                for direction in directions {
                    let nextX = x + direction[0], nextY = y + direction[1]
                    if isValid(nextX, y: nextY) {
                        nexts.append([nextX, nextY])
                        visited[nextX][nextY] = true
                    }
                }
            }
            ans += 1
            q = nexts
        }
        return -1
    }
}

//: [Next](@next)
