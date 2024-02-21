//: [Previous](@previous)

/*
 505. The Maze II
 中等
 
 There is a ball in a maze with empty spaces (represented as 0) and walls (represented as 1). The ball can go through the empty spaces by rolling up, down, left or right, but it won't stop rolling until hitting a wall. When the ball stops, it could choose the next direction.

 Given the m x n maze, the ball's start position and the destination, where start = [startrow, startcol] and destination = [destinationrow, destinationcol], return the shortest distance for the ball to stop at the destination. If the ball cannot stop at destination, return -1.

 The distance is the number of empty spaces traveled by the ball from the start position (excluded) to the destination (included).

 You may assume that the borders of the maze are all walls (see examples).

  

 Example 1:


 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [4,4]
 Output: 12
 Explanation: One possible way is : left -> down -> left -> down -> right -> down -> right.
 The length of the path is 1 + 1 + 3 + 1 + 2 + 2 + 2 = 12.
 Example 2:


 Input: maze = [[0,0,1,0,0],[0,0,0,0,0],[0,0,0,1,0],[1,1,0,1,1],[0,0,0,0,0]], start = [0,4], destination = [3,2]
 Output: -1
 Explanation: There is no way for the ball to stop at the destination. Notice that you can pass through the destination but you cannot stop there.
 Example 3:

 Input: maze = [[0,0,0,0,0],[1,1,0,0,1],[0,0,0,0,0],[0,1,0,0,1],[0,1,0,0,0]], start = [4,3], destination = [0,1]
 Output: -1
  

 Constraints:

 m == maze.length
 n == maze[i].length
 1 <= m, n <= 100
 maze[i][j] is 0 or 1.
 start.length == 2
 destination.length == 2
 0 <= startrow, destinationrow < m
 0 <= startcol, destinationcol < n
 Both the ball and the destination exist in an empty space, and they will not be in the same position initially.
 The maze contains at least 2 empty spaces.
 
 */

import Foundation

class Solution {
    var distance = [[Int]]()
    let directions = [[0, -1], [0, 1], [1, 0], [-1, 0]]
    
    func shortestDistance(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Int {
        distance = Array(repeating: Array(repeating: Int.max, count: maze[0].count), count: maze.count)
        let ans = dfs(maze, start, destination, steps: 0)
        return ans == Int.max ? -1 : ans
    }
    
    func dfs(_ maze: [[Int]], _ position: [Int], _ destination: [Int], steps: Int) -> Int {
        if position == destination {
            return steps
        }
        if distance[position[0]][position[1]] <= steps {
            return Int.max
        } else {
            distance[position[0]][position[1]] = steps
        }
        var ans = Int.max
        for direction in directions {
            let pos = stop(maze, position, direction: direction)
            if pos != position {
                let plus = abs(pos[0] - position[0]) + abs(pos[1] - position[1])
                ans = min(ans, dfs(maze, pos, destination, steps: steps + plus))
            }
        }
        return ans
    }
    
    func stop(_ maze: [[Int]], _ start: [Int], direction: [Int]) -> [Int] {
        var x = start[0], y = start[1]
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
