//: [Previous](@previous)

/*
 76. Minimum Window Substring
 困难
 Given two strings s and t of lengths m and n respectively, return the minimum window
 substring
  of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

 The testcases will be generated such that the answer is unique.

  

 Example 1:

 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 Example 2:

 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.
 Example 3:

 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.
  

 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.
  

 Follow up: Could you find an algorithm that runs in O(m + n) time?

 */

import Foundation

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var map = [Character: Int]()
        for c in t {
            map[c] = (map[c] ?? 0) + 1
        }
        let s = Array(s)
        var lo = 0, ans = (0, s.count + 1), cnt = t.count
        for hi in 0..<s.count {
            let c = s[hi]
            if let n = map[c] {
                map[c] = n - 1
                if n > 0 {
                    cnt -= 1
                }
            }
            while cnt == 0 {
                if hi - lo < ans.1 - ans.0 {
                    ans = (lo, hi)
                }
                let c = s[lo]
                if let n = map[c] {
                    map[c] = n + 1
                    if n >= 0 {
                        cnt += 1
                    }
                }
                lo += 1
            }
        }
        if ans.1 > s.count {
            return ""
        }
        return String(s[ans.0...ans.1])
    }
}

//: [Next](@next)
