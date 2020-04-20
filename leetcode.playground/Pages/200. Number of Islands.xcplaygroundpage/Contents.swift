//: [Previous](@previous)

/*
 
 200. Number of Islands
 
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 Input:
 11110
 11010
 11000
 00000

 Output: 1
 Example 2:

 Input:
 11000
 11000
 00100
 00011

 Output: 3
 
 */

import Foundation

class Solution {
    var world: [[Int]] = []
    var counter = 1
    func numIslands(_ grid: [[Character]]) -> Int {
        for i in 0..<grid.count {
            var temp: [Int] = []
            for j in 0..<grid[i].count {
                temp.append(Int(String(grid[i][j])) ?? 0)
            }
            world.append(temp)
        }
        for i in 0..<world.count {
            for j in 0..<world[0].count {
                let val = world[i][j]
                if val == 1 {
                    counter += 1
                    find(i, j)
                }
            }
        }
        
        return counter - 1
    }
    
    func find(_ x: Int, _ y: Int) {
        if qualify(x, y) && world[x][y] == 1 {
            world[x][y] = counter
        } else {
            return
        }
        if qualify(x-1, y) {
            find(x-1, y)
        }
        if qualify(x+1, y) {
            find(x+1, y)
        }
        if qualify(x, y-1) {
            find(x, y-1)
        }
        if qualify(x, y+1) {
            find(x, y+1)
        }
    }
    
    func qualify(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && y >= 0 && x < world.count && world.count > 0 && y < world[0].count
    }
}

//: [Next](@next)
