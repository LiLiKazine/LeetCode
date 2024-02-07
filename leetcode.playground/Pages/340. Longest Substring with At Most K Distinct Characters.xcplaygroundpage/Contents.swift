//: [Previous](@previous)

/*
 340. Longest Substring with At Most K Distinct Characters
 
 Given a string s and an integer k, return the length of the longest
 substring
  of s that contains at most k distinct characters.

  

 Example 1:

 Input: s = "eceba", k = 2
 Output: 3
 Explanation: The substring is "ece" with length 3.
 Example 2:

 Input: s = "aa", k = 1
 Output: 2
 Explanation: The substring is "aa" with length 2.
  

 Constraints:

 1 <= s.length <= 5 * 104
 0 <= k <= 50
 
 */

import Foundation

class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var l = 0, r = 0, ans = 0
        var map = [Character: Int]()
        while r < s.count {
            map[s[r]] = r
            r += 1
            if map.keys.count > k {
                var i = Int.max
                for j in map.values {
                   i = min(i, j)
                }
                l = i + 1
                map.removeValue(forKey: s[i])
            }
            ans = max(ans, r - l)
        }
        return ans
    }
}

//: [Next](@next)
