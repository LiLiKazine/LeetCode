//: [Previous](@previous)

/*
 
 1143. Longest Common Subsequence
 
 Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

 A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

 For example, "ace" is a subsequence of "abcde".
 A common subsequence of two strings is a subsequence that is common to both strings.

  

 Example 1:

 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 Example 2:

 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 Example 3:

 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
  

 Constraints:

 1 <= text1.length, text2.length <= 1000
 text1 and text2 consist of only lowercase English characters.
 
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1), text2 = Array(text2)
        var ans = 0
        var dp = Array(repeating: Array(repeating: 0, count: text2.count), count: text1.count)
        for i in 0..<text1.count {
            for j in 0..<text2.count {
                if i == 0 && j == 0 {
                    dp[i][j] = text1[i] == text2[j] ? 1 : 0
                } else {
                    let val = text1[i] == text2[j] ? 1 : 0
                    if i == 0 {
                        dp[i][j] = max(dp[i][j-1], val)
                    } else if j == 0 {
                        dp[i][j] = max(dp[i-1][j], val)
                    } else {
                        dp[i][j] = max(dp[i-1][j], dp[i][j-1], dp[i-1][j-1] + val)
                    }
                }
                ans = max(ans, dp[i][j])
            }
        }
        return ans
    }
}

//let text1 = "abcde", text2 = "ace"
//let text1 = "abc", text2 = "abc"
let text1 = "abc", text2 = "def"
let solution = Solution()
let ans = solution.longestCommonSubsequence(text1, text2)
ans

//: [Next](@next)
