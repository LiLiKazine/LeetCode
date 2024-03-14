//: [Previous](@previous)

/*
 864. Shortest Path to Get All Keys
 困难
 You are given an m x n grid grid where:

 '.' is an empty cell.
 '#' is a wall.
 '@' is the starting point.
 Lowercase letters represent keys.
 Uppercase letters represent locks.
 You start at the starting point and one move consists of walking one space in one of the four cardinal directions. You cannot walk outside the grid, or walk into a wall.

 If you walk over a key, you can pick it up and you cannot walk over a lock unless you have its corresponding key.

 For some 1 <= k <= 6, there is exactly one lowercase and one uppercase letter of the first k letters of the English alphabet in the grid. This means that there is exactly one key for each lock, and one lock for each key; and also that the letters used to represent the keys and locks were chosen in the same order as the English alphabet.

 Return the lowest number of moves to acquire all keys. If it is impossible, return -1.

  

 Example 1:


 Input: grid = ["@.a..","###.#","b.A.B"]
 Output: 8
 Explanation: Note that the goal is to obtain all the keys not to open all the locks.
 Example 2:


 Input: grid = ["@..aA","..B#.","....b"]
 Output: 6
 Example 3:


 Input: grid = ["@Aa"]
 Output: -1
  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 30
 grid[i][j] is either an English letter, '.', '#', or '@'.
 There is exactly one '@' in the grid.
 The number of keys in the grid is in the range [1, 6].
 Each key in the grid is unique.
 Each key in the grid has a matching lock.
 
 */

import Foundation

private extension String {
    var offset: Int {
        return value - "a".value
    }

    var value: Int {
        let scalars = unicodeScalars
        return Int(scalars[scalars.startIndex].value)
    }
}

class Solution {
    func shortestPathAllKeys(_ grid: [String]) -> Int {
        
        var g = [[String]]()
        
        var keyCnt = 0, start = [Int]()
        
        func isKey(_ s: String) -> Bool {
            if s == "." || s == "#" || s == "@" {
                return false
            }
            return s.lowercased() == s
        }
        
        func isDoor(_ s: String) -> Bool {
            if s == "." || s == "#" || s == "@" {
                return false
            }
            return s.uppercased() == s
        }
        
        for i in 0..<grid.count {
            let str = grid[i].map { String($0) }
            g.append(str)
            for j in 0..<str.count {
                if isKey(str[j]) {
                    keyCnt = keyCnt << 1
                    keyCnt += 1
                }
                if str[j] == "@" {
                    start = [i, j, 0]
                }
            }
        }
//        print("key count:", keyCnt, String(keyCnt, radix: 2))
        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        
        var visisted = Set<[Int]>()
        
        func isValid(_ x: Int, _ y: Int, _ keys: Int) -> Bool {
            if x < 0 || x >= g.count || y < 0 || y >= g[x].count {
                return false
            }
            if g[x][y] == "#" {
                return false
            }
            if visisted.contains([x, y,  keys]) {
                return false
            }
            if isDoor(g[x][y]) {
                let door = (1 << g[x][y].lowercased().offset)
                print([x, y], g[x][y], String(keys, radix: 2), String(door, radix: 2), g[x][y].offset, 1 << g[x][y].offset)
                if (keys & door) == 0 {
                    return false
                }
            }
            return true
        }
        
        var q = [start], steps = 1
        
        while q.count > 0 {
            
            var nexts = [[Int]]()
            
            while q.count > 0 {
                let p = q.removeFirst()
                // print([p[0], p[1]], String(p[2], radix: 2))

                for direction in directions {
                    let x = p[0] + direction[0], y = p[1] + direction[1]
                    var keys = p[2]
                    if isValid(x, y, keys) {
                        if isKey(g[x][y]) {
                            let key = 1 << g[x][y].offset
                            keys = keys | key
                            
                        }

                        if keys == keyCnt {
                            return steps
                        }
                        visisted.insert([x, y, keys])
                        nexts.append([x, y, keys])
                    }
                }
            }
            steps += 1
            q = nexts
        }
        
        return -1
    }
}

//: [Next](@next)
