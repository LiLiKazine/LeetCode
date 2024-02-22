//: [Previous](@previous)

/*
 1197. Minimum Knight Moves
 中等
 
 In an infinite chess board with coordinates from -infinity to +infinity, you have a knight at square [0, 0].
 
 A knight has 8 possible moves it can make, as illustrated below. Each move is two squares in a cardinal direction, then one square in an orthogonal direction.
 
 
 Return the minimum number of steps needed to move the knight to the square [x, y]. It is guaranteed the answer exists.
 
 
 
 Example 1:
 
 Input: x = 2, y = 1
 Output: 1
 Explanation: [0, 0] → [2, 1]
 Example 2:
 
 Input: x = 5, y = 5
 Output: 4
 Explanation: [0, 0] → [2, 1] → [4, 2] → [3, 4] → [5, 5]
 
 
 Constraints:
 
 -300 <= x, y <= 300
 0 <= |x| + |y| <= 300
 
 */

import Foundation

class Solution {
    
    let directions = [[1, 2], [1, -2], [-1, -2], [-1, 2], [2, 1], [2, -1], [-2, -1], [-2, 1]]
    
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        var queue = [[0, 0]]
        var visited = Set<[Int]>(arrayLiteral: [0, 0])
        var steps = 0
        while true {
            var nextQueue = [[Int]]()
            while !queue.isEmpty {
                let pos = queue.removeLast()
                if pos == [x, y] {
                    return steps
                }
                
                for direction in directions {
                    let nextX = pos[0] + direction[0], nextY = pos[1] + direction[1]
                    if visited.contains([nextX, nextY]) {
                        continue
                    }
                    visited.insert([nextX, nextY])
                    nextQueue.append([nextX, nextY])
                }
            }
            steps += 1
            queue = nextQueue
        }
        return -1
    }
}

//: [Next](@next)
