//: [Previous](@previous)

/*
 1100. Find K-Length Substrings With No Repeated Characters
 
 Given a string s and an integer k, return the number of substrings in s of length k with no repeated characters.

  

 Example 1:

 Input: s = "havefunonleetcode", k = 5
 Output: 6
 Explanation: There are 6 substrings they are: 'havef','avefu','vefun','efuno','etcod','tcode'.
 Example 2:

 Input: s = "home", k = 5
 Output: 0
 Explanation: Notice k can be larger than the length of s. In this case, it is not possible to find any substring.
  

 Constraints:

 1 <= s.length <= 104
 s consists of lowercase English letters.
 1 <= k <= 104
 
 */

import Foundation

class Solution {
    func numKLenSubstrNoRepeats(_ s: String, _ k: Int) -> Int {
        if s.count < k { return 0 }
        let s = Array(s)
        var l = 0, r = 0, ans = 0
        var dict = [Character: Int]()
        while r < s.count {
            let c = s[r]
            r += 1
            if let i = dict.removeValue(forKey: c) {
                for j in l...i {
                    dict.removeValue(forKey: s[j])
                }
                l = i + 1
            }
            dict[c] = r
            if r - l >= k {
                ans += 1
            }
        }
        return ans
    }
}

//: [Next](@next)
