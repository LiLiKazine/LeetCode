//: [Previous](@previous)

/*
 392. Is Subsequence
 简单
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

  

 Example 1:

 Input: s = "abc", t = "ahbgdc"
 Output: true
 Example 2:

 Input: s = "axc", t = "ahbgdc"
 Output: false
  

 Constraints:

 0 <= s.length <= 100
 0 <= t.length <= 104
 s and t consist only of lowercase English letters.
  

 Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?
 
 */

import Foundation

/*
 class Solution {
     func isSubsequence(_ s: String, _ t: String) -> Bool {
         // 在string上进行搜索, 首先想到2 pointers类型解法
         //
         if s.length == 0 { return true }
         else if t.length == 0 { return false }

         var sArray = Array(s)
         var sp = 0
         var tp = 0

         for char in t {
             if char == sArray[sp] {
                 sp += 1
                 if sp == s.length { return true }
             }
         }

         return false
     }
 }
 */

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else { return false }
        if s.count == t.count {
            return s == t
        }
        let t = Array(t)
        var j = 0
        for c in s {
            while j < t.count, c != t[j] {
                j += 1
            }
            j += 1
        }
        return j <= t.count
    }
}

//: [Next](@next)
