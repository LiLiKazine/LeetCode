//: [Previous](@previous)

/*
 1358. Number of Substrings Containing All Three Characters
 中等
 Given a string s consisting only of characters a, b and c.

 Return the number of substrings containing at least one occurrence of all these characters a, b and c.

  

 Example 1:

 Input: s = "abcabc"
 Output: 10
 Explanation: The substrings containing at least one occurrence of the characters a, b and c are "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc" and "abc" (again).
 Example 2:

 Input: s = "aaacb"
 Output: 3
 Explanation: The substrings containing at least one occurrence of the characters a, b and c are "aaacb", "aacb" and "acb".
 Example 3:

 Input: s = "abc"
 Output: 1
  

 Constraints:

 3 <= s.length <= 5 x 10^4
 s only consists of a, b or c characters.
 
 */

import Foundation

class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        let s = Array(s)
        var ans = 0
        var dict = [Character: Int](), cnt = 0
        var l = 0
        for (r, char) in s.enumerated() {
            dict[char] = dict[char, default: 0] + 1
            if dict[char]! == 1 {
                cnt += 1
            }
            while cnt == 3 {
                ans += (s.count - r)
                let char = s[l]
                dict[char] = dict[char, default: 0] - 1
                if dict[char]! == 0 {
                    cnt -= 1
                }
                l += 1
            }
        }
        return ans
    }
}

//: [Next](@next)
