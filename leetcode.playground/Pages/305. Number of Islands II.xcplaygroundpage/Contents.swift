//: [Previous](@previous)

/*
 305. Number of Islands II
 困难
 
 You are given an empty 2D binary grid grid of size m x n. The grid represents a map where 0's represent water and 1's represent land. Initially, all the cells of grid are water cells (i.e., all the cells are 0's).

 We may perform an add land operation which turns the water at position into a land. You are given an array positions where positions[i] = [ri, ci] is the position (ri, ci) at which we should operate the ith operation.

 Return an array of integers answer where answer[i] is the number of islands after turning the cell (ri, ci) into a land.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

  

 Example 1:


 Input: m = 3, n = 3, positions = [[0,0],[0,1],[1,2],[2,1]]
 Output: [1,1,2,3]
 Explanation:
 Initially, the 2d grid is filled with water.
 - Operation #1: addLand(0, 0) turns the water at grid[0][0] into a land. We have 1 island.
 - Operation #2: addLand(0, 1) turns the water at grid[0][1] into a land. We still have 1 island.
 - Operation #3: addLand(1, 2) turns the water at grid[1][2] into a land. We have 2 islands.
 - Operation #4: addLand(2, 1) turns the water at grid[2][1] into a land. We have 3 islands.
 Example 2:

 Input: m = 1, n = 1, positions = [[0,0]]
 Output: [1]
  

 Constraints:

 1 <= m, n, positions.length <= 104
 1 <= m * n <= 104
 positions[i].length == 2
 0 <= ri < m
 0 <= ci < n
  

 Follow up: Could you solve it in time complexity O(k log(mn)), where k == positions.length?

 */

import Foundation

class Solution {
    var route = [[[Int]]]()
    func numIslands2(_ m: Int, _ n: Int, _ positions: [[Int]]) -> [Int] {

        route = Array(repeating: Array(repeating: [0, 0], count: n), count: m)
        var set = Set<[Int]>()
        for i in 0..<m {
            for j in 0..<n {
                route[i][j] = [i, j]
            }
        }
        var count = 0
        var ans = [Int]()
        for position in positions {
            if !set.contains(position) {
                let x = position[0], y = position[1]
                set.insert([x, y])
                count += 1
                if x > 0 && set.contains([x - 1, y]) {
                    if combine(position, [x - 1, y]) {
                        count -= 1
                    }
                }
                if y > 0 && set.contains([x, y - 1]) {
                    if combine(position, [x, y - 1]) {
                        count -= 1
                    }
                }
                if x < m - 1 && set.contains([x + 1, y]) {
                    if combine(position, [x + 1, y]) {
                        count -= 1
                    }
                }
                if y < n - 1 && set.contains([x, y + 1]) {
                    if combine(position, [x, y + 1]) {
                        count -= 1
                    }
                }
            }
            ans.append(count)
        }
        return ans
    }
    
    func combine(_ p1: [Int], _ p2: [Int]) -> Bool {
        let a = find(p1), b = find(p2)
        if a == b { return false }
        route[a[0]][a[1]] = b
        return true
    }
    
    func find(_ position: [Int]) -> [Int] {
        let dest = route[position[0]][position[1]]
        if position == dest {
            return dest
        }
        route[position[0]][position[1]] = find(dest)
        return route[position[0]][position[1]]
    }
 }

//: [Next](@next)
