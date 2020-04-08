//: [Previous](@previous)

/*
 
 329. Longest Increasing Path in a Matrix
 
 Given an integer matrix, find the length of the longest increasing path.

 From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).

 Example 1:

 Input: nums =
 [
   [9,9,4],
   [6,6,8],
   [2,1,1]
 ]
 Output: 4
 Explanation: The longest increasing path is [1, 2, 6, 9].
 Example 2:

 Input: nums =
 [
   [3,4,5],
   [3,2,6],
   [2,2,1]
 ]
 Output: 4
 Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.
 
 */

import Foundation

class Solution {
    let dir: [[Int]] = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    var cache: [[Int]] = []
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        var ans = 0
        if matrix.count > 0 {
            cache = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
            for i in 0..<matrix.count {
                for j in 0..<matrix[0].count {
                    ans = max(ans, dfs(matrix, i, j))
                }
            }
        }
        return ans
    }
    func dfs(_ matrix: [[Int]], _ i: Int, _ j: Int) -> Int {
        if cache[i][j] > 0 {
            return cache[i][j]
        }
        for d in dir {
            let x = i + d[0], y = j + d[1]
            if x < matrix.count && x >= 0 && y < matrix[0].count && y >= 0 && matrix[x][y] > matrix[i][j] {
                cache[i][j] = max(cache[i][j], dfs(matrix, x, y))
            }
        }
        cache[i][j] += 1
        return cache[i][j]
    }
}

let solution = Solution()
let input = [[3,4,5],
             [3,2,6],
             [2,2,1]]
let res = solution.longestIncreasingPath(input)

//: [Next](@next)
