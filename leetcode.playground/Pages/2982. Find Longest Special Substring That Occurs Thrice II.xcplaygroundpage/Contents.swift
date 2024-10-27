//: [Previous](@previous)

/*
 2982. Find Longest Special Substring That Occurs Thrice II
 中等
 You are given a string s that consists of lowercase English letters.

 A string is called special if it is made up of only a single character. For example, the string "abc" is not special, whereas the strings "ddd", "zz", and "f" are special.

 Return the length of the longest special substring of s which occurs at least thrice, or -1 if no special substring occurs at least thrice.

 A substring is a contiguous non-empty sequence of characters within a string.

  

 Example 1:

 Input: s = "aaaa"
 Output: 2
 Explanation: The longest special substring which occurs thrice is "aa": substrings "aaaa", "aaaa", and "aaaa".
 It can be shown that the maximum length achievable is 2.
 Example 2:

 Input: s = "abcdef"
 Output: -1
 Explanation: There exists no special substring which occurs at least thrice. Hence return -1.
 Example 3:

 Input: s = "abcaba"
 Output: 1
 Explanation: The longest special substring which occurs thrice is "a": substrings "abcaba", "abcaba", and "abcaba".
 It can be shown that the maximum length achievable is 1.
  

 Constraints:

 3 <= s.length <= 5 * 105
 s consists of only lowercase English letters.
 */

import Foundation

class Solution {
    
    func maximumLength(_ s: String) -> Int {
        let s = Array(s)

        func fill() -> [Int: [Character: Int]] {
            var cache: [Int: [Character: Int]] = [:]
            var l = 0, r = 0
            while r < s.count {
                while r < s.count && s[l] == s[r] {
                    r += 1
                }
                cache[r - l, default: [:]][s[l], default: 0] += 1
                l = r
            }
            return cache
        }
        let cache = fill()
        let len = s.count
        var l = 1, r = len - 2
        func hasThree(_ k: Int) -> Bool {
            var count = [Character : Int]()
            for (key, value) in cache where key >= k {
                for (char, pairs) in value {
                    let val = (key - k + 1) * pairs
                    count[char, default: 0] += val
                    if count[char, default: 0] >= 3 {
                        return true
                    }
                }
            }
            return false
        }
        while l <= r {
            let mid = l + (r - l) / 2
            if hasThree(mid) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return r == 0 ? -1 : r
    }
}

//: [Next](@next)
