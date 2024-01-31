//: [Previous](@previous)

/*
 
 279. Perfect Squares
 
 Given an integer n, return the least number of perfect square numbers that sum to n.

 A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

  

 Example 1:

 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 Example 2:

 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
  

 Constraints:

 1 <= n <= 104
 
 */

import Foundation


class Solution {
    func numSquares(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var perfects = Array(repeating: false, count: n + 1)
        perfects[0] = true
        perfects[1] = true
        for i in 2...n {
            perfects[i] = i.isPerfect
        }
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        for i in 2...n {
            if perfects[i] {
                dp[i] = 1
            } else {
                var ans = Int.max
                for j in 1..<i {
                    let num = (perfects[j] ? 1 : dp[j]) + (perfects[i-j] ? 1 : dp[i-j])
                    ans = min(ans, num)
                }
                dp[i] = ans
            }
        }
        return dp[n]
    }
}

private extension Int {
    var isPerfect: Bool {
        if self <= 1 { return true }
        var l = 0, r = self
        while l < r {
            let mid = (r - l) / 2 + l
            let val = mid * mid
            if val == self {
                return true
            }
            if val > self {
                r = mid
            }
            if val < self {
                l = mid + 1
            }
            
        }
        return l * l == self
    }
}

let n = 12
let solution = Solution()
let ans = solution.numSquares(n)
ans

//: [Next](@next)
