//: [Previous](@previous)

/*
 97. Interleaving String
 中等
 Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.

 An interleaving of two strings s and t is a configuration where s and t are divided into n and m
 substrings
  respectively, such that:

 s = s1 + s2 + ... + sn
 t = t1 + t2 + ... + tm
 |n - m| <= 1
 The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
 Note: a + b is the concatenation of strings a and b.

  

 Example 1:


 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 Output: true
 Explanation: One way to obtain s3 is:
 Split s1 into s1 = "aa" + "bc" + "c", and s2 into s2 = "dbbc" + "a".
 Interleaving the two splits, we get "aa" + "dbbc" + "bc" + "a" + "c" = "aadbbcbcac".
 Since s3 can be obtained by interleaving s1 and s2, we return true.
 Example 2:

 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 Output: false
 Explanation: Notice how it is impossible to interleave s2 with any other string to obtain s3.
 Example 3:

 Input: s1 = "", s2 = "", s3 = ""
 Output: true
  

 Constraints:

 0 <= s1.length, s2.length <= 100
 0 <= s3.length <= 200
 s1, s2, and s3 consist of lowercase English letters.
  

 Follow up: Could you solve it using only O(s2.length) additional memory space?

 */

import Foundation

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s3.count == s1.count + s2.count else {
            return false
        }
        if s3.isEmpty { return true }
        if s1.isEmpty { return s2 == s3 }
        if s2.isEmpty { return s1 == s3 }
        
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
        let len1 = s1.count, len2 = s2.count
        
        var dp = Array(repeating: Array(repeating: false, count: len2 + 1), count: len1 + 1)
        dp[0][0] = true
        for i in 0..<len1 {
            let match = s1[i] == s3[i]
            dp[i+1][0] = match && dp[i][0]
        }
        for j in 0..<len2 {
            let match = s2[j] == s3[j]
            dp[0][j+1] = match  && dp[0][j]
        }
        for i in 1...len1 {
            for j in 1...len2 {
                if dp[i-1][j] && s1[i-1] == s3[i+j-1] {
                    dp[i][j] = true
                }
                if dp[i][j-1] && s2[j-1] == s3[i+j-1] {
                    dp[i][j] = true
                }
            }
        }
        return dp[len1][len2]
    }
}

//: [Next](@next)
