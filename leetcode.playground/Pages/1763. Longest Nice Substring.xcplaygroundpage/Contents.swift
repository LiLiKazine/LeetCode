//: [Previous](@previous)

/*
 1763. Longest Nice Substring
 简单
 A string s is nice if, for every letter of the alphabet that s contains, it appears both in uppercase and lowercase. For example, "abABB" is nice because 'A' and 'a' appear, and 'B' and 'b' appear. However, "abA" is not because 'b' appears, but 'B' does not.

 Given a string s, return the longest substring of s that is nice. If there are multiple, return the substring of the earliest occurrence. If there are none, return an empty string.

  

 Example 1:

 Input: s = "YazaAay"
 Output: "aAa"
 Explanation: "aAa" is a nice string because 'A/a' is the only letter of the alphabet in s, and both 'A' and 'a' appear.
 "aAa" is the longest nice substring.
 Example 2:

 Input: s = "Bb"
 Output: "Bb"
 Explanation: "Bb" is a nice string because both 'B' and 'b' appear. The whole string is a substring.
 Example 3:

 Input: s = "c"
 Output: ""
 Explanation: There are no nice substrings.
  

 Constraints:

 1 <= s.length <= 100
 s consists of uppercase and lowercase English letters.
 
 */

import Foundation

class Solution {
    func longestNiceSubstring(_ s: String) -> String {
        let s = Array(s)
        var ans = ""
        for k in 1...26 {
            var left = 0, upper = [Character: Int](), lower = [Character: Int](), sum = 0, tot = 0
            for right in 0..<s.count {
                let char = s[right]
                if char.isUppercase {
                    let lo = char.lowercased().first!
                    let val = upper[char, default: 0] + 1
                    upper[char] = val
                    if val == 1 && lower[lo, default: 0] > 0 {
                        tot += 1
                    }
                    if val == 1 && lower[lo, default: 0] == 0 {
                        sum += 1
                    }
                } else {
                    let up = char.uppercased().first!
                    let val = lower[char, default: 0] + 1
                    lower[char] = val
                    if val == 1 && upper[up, default: 0] > 0 {
                        tot += 1
                    }
                    if val == 1 && upper[up, default: 0] == 0 {
                        sum += 1
                    }
                }
                while sum > k && left < right {
                    let char = s[left]
                    if char.isUppercase {
                        let lo = char.lowercased().first!
                        let val = upper[char, default: 0] - 1
                        upper[char] = val
                        if val == 0 && lower[lo, default: 0] == 0 {
                            sum -= 1
                        }
                        if val == 0 && lower[lo, default: 0] > 0 {
                            tot -= 1
                        }
                    } else {
                        let up = char.uppercased().first!
                        let val = lower[char, default: 0] - 1
                        lower[char] = val
                        if val == 0 && upper[up, default: 0] == 0 {
                            sum -= 1
                        }
                        if val == 0 && upper[up, default: 0] > 0 {
                            tot -= 1
                        }
                    }
                    left += 1
                }
                if sum == tot && right - left + 1 > ans.count {
                    ans = String(s[left...right])
                }
                print(left, right, sum, tot, k)
                print("lower:", lower)
                print("upper:", upper)

            }
        }
        return ans
    }
}

//: [Next](@next)
