//: [Previous](@previous)

/*
 490. The Maze
 中等
 
 There is a ball in a maze with empty spaces (represented as 0) and walls (represented as 1). The ball can go through the empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

 Given the m x n maze, the ball's start position and the destination, where start = [startrow, startcol] and destination = [destinationrow, destinationcol], return true if the ball can stop at the destination, otherwise return false.

 You may assume that the borders of the maze are all walls (see examples).

  

 Example 1:


 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [4,4]
 Output: true
 Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.
 Example 2:


 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [3,2]
 Output: false
 Explanation: There is no way for the ball to stop at the destination. Notice that you can pass through the destination but you cannot stop there.
 Example 3:

 Input: maze = [[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], start = [4,3], destination = [0,1]
 Output: false
  

 Constraints:

 m == maze.length
 n == maze[i].length
 1 <= m, n <= 100
 maze[i][j] is 0 or 1.
 start.length == 2
 destination.length == 2
 0 <= startrow, destinationrow <= m
 0 <= startcol, destinationcol <= n
 Both the ball and the destination exist in an empty space, and they will not be in the same position initially.
 The maze contains at least 2 empty spaces.
 
 */

import Foundation

class Solution {
    var visited = Set<[Int]>()
    
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        if start == destination {
            return true
        }
        
        if visited.contains(start) {
            return false
        }
        visited.insert(start)

        var ans = false
        let directions = [[0, -1], [0, 1], [1, 0], [-1, 0]]
        for direction in directions {
            let pos = stop(maze, start, direction: direction)
            if pos != start {
                ans = ans || hasPath(maze, pos, destination)
                if ans {
                    return true
                }
            }
        }
        return ans
    }
    
    func stop(_ maze: [[Int]], _ start: [Int], direction: [Int]) -> [Int] {
        var x = start[0], y = start[1]
        print("direction:", direction)
        while true {
            x += direction[0]
            y += direction[1]
            guard x >= 0 && x < maze.count && y >= 0 && y < maze[x].count && maze[x][y] == 0 else {
                x -= direction[0]
                y -= direction[1]
                break
            }
        }
        return [x, y]
    }
    
}


//: [Next](@next)
