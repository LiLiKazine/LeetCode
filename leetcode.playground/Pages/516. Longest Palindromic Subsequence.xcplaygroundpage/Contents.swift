//: [Previous](@previous)

/*
 516. Longest Palindromic Subsequence
 
 Given a string s, find the longest palindromic subsequence's length in s.

 A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

  

 Example 1:

 Input: s = "bbbab"
 Output: 4
 Explanation: One possible longest palindromic subsequence is "bbbb".
 Example 2:

 Input: s = "cbbd"
 Output: 2
 Explanation: One possible longest palindromic subsequence is "bb".
  

 Constraints:

 1 <= s.length <= 1000
 s consists only of lowercase English letters.
 
 */

import Foundation

class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        if s.count <= 1 {
            return s.count
        }
        let s = s.map { String($0) }
        var dp = Array(repeating: Array(repeating: 1, count: s.count), count: s.count)
        var ans = 0
        for len in 1..<s.count {
            for i in 0..<s.count {
                let j = i + len
                guard j < s.count else {
                    break
                }
                if s[i] == s[j] {
                    if len == 1 {
                        dp[i][j] = 2
                    } else {
                        dp[i][j] = dp[i+1][j-1] + 2
                    }
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i+1][j])
                }
                ans = max(ans, dp[i][j])
            }
        }
        return ans
    }
}

//: [Next](@next)
