//: [Previous](@previous)

/*
 790. Domino and Tromino Tiling
 
 You have two types of tiles: a 2 x 1 domino shape and a tromino shape. You may rotate these shapes.


 Given an integer n, return the number of ways to tile an 2 x n board. Since the answer may be very large, return it modulo 109 + 7.

 In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.

  

 Example 1:


 Input: n = 3
 Output: 5
 Explanation: The five different ways are show above.
 Example 2:

 Input: n = 1
 Output: 1
  

 Constraints:

 1 <= n <= 1000
 
 */

import Foundation

class Solution {

    let modulo = 1000000000 + 7

    func numTilings(_ n: Int) -> Int {
        var dp = Array(repeating: [0, 1, 2, 3], count: n)
        //0 没有覆盖 1 上面被覆盖 2 下面被覆盖 3 全被覆盖
        dp[0][0] = 1
        dp[0][3] = 1
        for i in 1..<dp.count {
            dp[i][0] = dp[i-1][3]
            dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % modulo
            dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % modulo
            dp[i][3] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2] + dp[i-1][3]) % modulo
        }
        return dp[n-1][3] % modulo
    }
}

//: [Next](@next)
