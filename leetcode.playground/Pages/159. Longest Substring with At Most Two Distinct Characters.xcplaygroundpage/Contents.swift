//: [Previous](@previous)

/*
 159. Longest Substring with At Most Two Distinct Characters
 
 Given a string s, return the length of the longest
 substring
  that contains at most two distinct characters.

  

 Example 1:

 Input: s = "eceba"
 Output: 3
 Explanation: The substring is "ece" which its length is 3.
 Example 2:

 Input: s = "ccaabbb"
 Output: 5
 Explanation: The substring is "aabbb" which its length is 5.
  

 Constraints:

 1 <= s.length <= 105
 s consists of English letters.
 
 */

import Foundation

class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var ans = 0, l = 0, r = 0
        var map = [Character: Int]()
        let s = Array(s)
        while r < s.count {
            map[s[r]] = r
            r += 1
            if map.keys.count == 3 {
                var delIndex = Int.max
                for i in map.values {
                    delIndex = min(i, delIndex)
                }
                map.removeValue(forKey: s[delIndex])
                l = delIndex + 1
            }
            ans = max(ans, r - l)
        }
        return ans
    }
}

//: [Next](@next)
