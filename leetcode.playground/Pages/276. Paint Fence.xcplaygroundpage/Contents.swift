//: [Previous](@previous)

/*
 276. Paint Fence
 中等
 You are painting a fence of n posts with k different colors. You must paint the posts following these rules:

 Every post must be painted exactly one color.
 There cannot be three or more consecutive posts with the same color.
 Given the two integers n and k, return the number of ways you can paint the fence.

  

 Example 1:


 Input: n = 3, k = 2
 Output: 6
 Explanation: All the possibilities are shown.
 Note that painting all the posts red or all the posts green is invalid because there cannot be three posts in a row with the same color.
 Example 2:

 Input: n = 1, k = 1
 Output: 1
 Example 3:

 Input: n = 7, k = 2
 Output: 42
  

 Constraints:

 1 <= n <= 50
 1 <= k <= 105
 The testcases are generated such that the answer is in the range [0, 231 - 1] for the given n and k.
 
 */

import Foundation

class Solution {
    func numWays(_ n: Int, _ k: Int) -> Int {
        if n == 1 { return k }
        if n == 2 { return k * k }
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: k), count: n + 1)
        for color in 0..<k {
            dp[1][color][0] = 1
        }
        var ans = 0
        for i in 2...n {
            for color in 0..<k {
                for cnt in 0...1 {
                    if cnt == 0 {
                        for index in 0..<dp[i-1].count {
                            if index == color {
                                continue
                            }
                            dp[i][color][cnt] += dp[i-1][index].reduce(0, +)
                        }
                    } else {
                        dp[i][color][cnt] = dp[i-1][color][cnt-1]
                    }
                    if i == n {
                        ans += dp[i][color][cnt]
                    }
                }
            }
        }
        //        let ans = dp[n].reduce(0) { partialResult, colors in
        //            return partialResult + colors.reduce(0, +)
        //        }
        return ans
    }
}

//: [Next](@next)
