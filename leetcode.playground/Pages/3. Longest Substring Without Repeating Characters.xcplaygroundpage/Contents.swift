//: [Previous](@previous)

/*
 3. Longest Substring Without Repeating Characters
 中等
 Given a string s, find the length of the longest
 substring
  without repeating characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
  

 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = Array(s)
        var map = [Character: Int]()
        var lo = 0, ans = 0
        for hi in 0..<s.count {
            let c = s[hi]
            if let i = map[c] {
                lo = max(lo, i + 1)
            }
            map[c] = hi
            ans = max(ans, hi - lo + 1)
        }
        return ans
    }
}

//: [Next](@next)
