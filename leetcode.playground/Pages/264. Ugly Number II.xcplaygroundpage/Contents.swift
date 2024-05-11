//: [Previous](@previous)

/*
 
 264. Ugly Number II
 
 Given an integer n, return the nth ugly number.

 Ugly number is a positive number whose prime factors only include 2, 3, and/or 5.

  

 Example 1:

 Input: n = 10
 Output: 12
 Explanation: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.
 Example 2:

 Input: n = 1
 Output: 1
 Explanation: 1 is typically treated as an ugly number.
  

 Constraints:

 1 <= n <= 1690
 
 */

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        var p2 = 1, p3 = 1, p5 = 1
        for i in 2...n {
            let num2 = dp[p2] * 2, num3 = dp[p3] * 3, num5 = dp[p5] * 5
            dp[i] = min(num2, num3, num5)
            if dp[i] == num2 {
                p2 += 1
            }
            if dp[i] == num3 {
                p3 += 1
            }
            if dp[i] == num5 {
                p5 += 1
            }
        }
        return dp[n]
    }
}

let n = 10
let solution = Solution()
let ans = solution.nthUglyNumber(n)
ans

//: [Next](@next)
