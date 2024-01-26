//: [Previous](@previous)

/*
 
 70. Climbing Stairs
 
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
  

 Constraints:

 1 <= n <= 45
 
 */

import Foundation

class Solution {
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        var dp: [[Int]] = [Array(repeating: 0, count: n), Array(repeating: 0, count: n)]
        dp[0][0] = 1
        dp[1][0] = 0
        dp[0][1] = 1
        dp[1][1] = 1
        for i in 2..<n {
            dp[0][i] = dp[0][i-1] + dp[1][i-1]
            dp[1][i] = dp[0][i-2] + dp[1][i-2]
        }
        return dp[0][n-1] + dp[1][n-1]
    }
}

let solution = Solution()
let n = 3
let ans = solution.climbStairs(n)

//: [Next](@next)
