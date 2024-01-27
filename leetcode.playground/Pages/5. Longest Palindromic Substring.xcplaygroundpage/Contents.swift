//: [Previous](@previous)

/*
 
 5. Longest Palindromic Substring
 
 Given a string s, return the longest
 palindromic
  
 substring
  in s.

  

 Example 1:

 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:

 Input: s = "cbbd"
 Output: "bb"
  

 Constraints:

 1 <= s.length <= 1000
 s consist of only digits and English letters.
 
 */

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        let arr = s.map { String($0) }
        var head = 0, tail = 0
        for len in 1...arr.count {
            for i in 0..<arr.count {
                let j = i + len - 1
                guard j < arr.count else {
                    break
                }
                if len == 1 {
                    dp[i][j] = 1
                } else if len == 2 {
                    dp[i][j] = arr[i] == arr[j] ? 1 : 0
                } else {
                    dp[i][j] = (arr[i] == arr[j] && dp[i+1][j-1] > 0) ? 1 : 0
                }
                if dp[i][j] > 0 && len > tail - head + 1 {
                    head = i
                    tail = j
                }
            }
        }
        return arr[head...tail].joined()
    }
}
let solution = Solution()
let s = "bb"
let ans = solution.longestPalindrome(s)

//: [Next](@next)
