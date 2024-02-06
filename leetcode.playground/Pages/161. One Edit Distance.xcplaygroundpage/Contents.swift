//: [Previous](@previous)

/*
 161. One Edit Distance
 
 Given two strings s and t, return true if they are both one edit distance apart, otherwise return false.

 A string s is said to be one distance apart from a string t if you can:

 Insert exactly one character into s to get t.
 Delete exactly one character from s to get t.
 Replace exactly one character of s with a different character to get t.
  

 Example 1:

 Input: s = "ab", t = "acb"
 Output: true
 Explanation: We can insert 'c' into s to get t.
 Example 2:

 Input: s = "", t = ""
 Output: false
 Explanation: We cannot get t from s by only one step.
  

 Constraints:

 0 <= s.length, t.length <= 104
 s and t consist of lowercase letters, uppercase letters, and digits.
 
 */

import Foundation

class Solution {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        if abs(s.count - t.count) > 1 { return false }
        if s.count == t.count {
            let s = Array(s), t = Array(t)
            var dif = 0
            for i in 0..<s.count {
                if s[i] != t[i] {
                    dif += 1
                }
                if dif > 1 { return false}
            }
            return dif == 1
        }
        
        var short = s.count < t.count ? Array(s) : Array(t)
        let long = s.count > t.count ? Array(s) : Array(t)
        let n = short.count
        var dif = 0
        for i in 0..<n {
            if short[i] != long[i] {
                dif += 1
                short.insert(long[i], at: i)
            }
            if dif > 1 {
                return false
            }
        }
        if dif == 0 { return true }
        if dif == 1 {
            return short.last == long.last
        }
        return false
    }
}

//: [Next](@next)
