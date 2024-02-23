//: [Previous](@previous)

/*
 286. Walls and Gates
 中等
 
 You are given an m x n grid rooms initialized with these three possible values.

 -1 A wall or an obstacle.
 0 A gate.
 INF Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
 Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.

  

 Example 1:


 Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
 Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
 Example 2:

 Input: rooms = [[-1]]
 Output: [[-1]]
  

 Constraints:

 m == rooms.length
 n == rooms[i].length
 1 <= m, n <= 250
 rooms[i][j] is -1, 0, or 231 - 1.
 
 */

import Foundation

class Solution {
    
    let wall = -1
    let gate = 0
    let empty = 2147483647
    let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    func wallsAndGates(_ rooms: inout [[Int]]) {
        
        var queue = [[Int]]()
        
        for i in 0..<rooms.count {
            for j in 0..<rooms[i].count {
                let val = rooms[i][j]
                if val == gate {
                    queue.append([i, j])
                }
            }
        }
        
        while !queue.isEmpty {
            let room = queue.removeFirst()
            for direction in directions {
                let x = room[0] + direction[0], y = room[1] + direction[1]
                if x < 0 || x >= rooms.count || y < 0 || y >= rooms[x].count || rooms[x][y] != empty {
                    continue
                }
                rooms[x][y] = rooms[room[0]][room[1]] + 1
                queue.append([x, y])
            }
        }
        
    }
}

//: [Next](@next)
