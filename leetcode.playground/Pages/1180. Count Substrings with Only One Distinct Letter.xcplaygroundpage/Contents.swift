//: [Previous](@previous)

/*
 1180. Count Substrings with Only One Distinct Letter
 简单
 Given a string s, return the number of substrings that have only one distinct letter.

  

 Example 1:

 Input: s = "aaaba"
 Output: 8
 Explanation: The substrings with one distinct letter are "aaa", "aa", "a", "b".
 "aaa" occurs 1 time.
 "aa" occurs 2 times.
 "a" occurs 4 times.
 "b" occurs 1 time.
 So the answer is 1 + 2 + 4 + 1 = 8.
 Example 2:

 Input: s = "aaaaaaaaaa"
 Output: 55
  

 Constraints:

 1 <= s.length <= 1000
 s[i] consists of only lowercase English letters.
 
 */

import Foundation

class Solution {
    func countLetters(_ s: String) -> Int {
        var s = Array(s)
        var slice = "", ans = 0
        while s.count > 0 {
            let c = s.removeFirst()
            if slice.isEmpty || slice.last == c {
            } else {
                ans += cnt(slice.count)
                slice = ""
            }
            slice += String(c)
        }
        if slice.count > 0 {
            ans += cnt(slice.count)
        }
        return ans
    }
    
    func cnt(_ n: Int) -> Int {
        let n = Double(n)
        return Int((n + 1) * (n / 2))
    }
}

//: [Next](@next)
