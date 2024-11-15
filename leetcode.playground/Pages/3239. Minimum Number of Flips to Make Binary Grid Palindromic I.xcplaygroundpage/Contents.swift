//: [Previous](@previous)

/*
 3239. Minimum Number of Flips to Make Binary Grid Palindromic I
 中等
 You are given an m x n binary matrix grid.

 A row or column is considered palindromic if its values read the same forward and backward.

 You can flip any number of cells in grid from 0 to 1, or from 1 to 0.

 Return the minimum number of cells that need to be flipped to make either all rows palindromic or all columns palindromic.

  

 Example 1:

 Input: grid = [[1,0,0],[0,0,0],[0,0,1]]

 Output: 2

 Explanation:



 Flipping the highlighted cells makes all the rows palindromic.

 Example 2:

 Input: grid = [[0,1],[0,1],[0,0]]

 Output: 1

 Explanation:



 Flipping the highlighted cell makes all the columns palindromic.

 Example 3:

 Input: grid = [[1],[0]]

 Output: 0

 Explanation:

 All rows are already palindromic.

  

 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m * n <= 2 * 105
 0 <= grid[i][j] <= 1
 */

import Foundation

class Solution {
    func minFlips(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        
        var ans1 = 0, ans2 = 0
        for i in 0..<m {
            var l = 0, r = n - 1
            while l < r {
                if grid[i][l] != grid[i][r] {
                    ans1 += 1
                }
                l += 1
                r -= 1
            }
        }
        
        for j in 0..<n {
            var l = 0, r = m - 1
            while l < r {
                if grid[l][j] != grid[r][j] {
                    ans2 += 1
                }
                l += 1
                r -= 1
            }
        }
        return min(ans1, ans2)
    }
}


//: [Next](@next)
