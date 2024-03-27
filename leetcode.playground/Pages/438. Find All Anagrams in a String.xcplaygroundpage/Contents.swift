//: [Previous](@previous)

/*
 
 438. Find All Anagrams in a String
 中等
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  

 Example 1:

 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
  

 Constraints:

 1 <= s.length, p.length <= 3 * 104
 s and p consist of lowercase English letters.
 
 */

import Foundation

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var ans = [Int](), cnt = [Character: Int]()
        let s = Array(s), p = Array(p), len = p.count
        for c in p {
            cnt[c] = (cnt[c] ?? 0) + 1
        }
        
        var map = [Character: Int](), lo = 0
        
        for hi in 0..<s.count {
            map[s[hi]] = (map[s[hi]] ?? 0) + 1
            let dis = hi - lo + 1
            if dis == len {
                if map == cnt {
                    ans.append(lo)
                }
                map[s[lo]] = map[s[lo]]! - 1
                if let n = map[s[lo]], n == 0 {
                    map.removeValue(forKey: s[lo])
                }
                lo += 1
            }
        }
        
        return ans
    }
}

//: [Next](@next)
