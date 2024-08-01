//: [Previous](@previous)

/*
 2516. Take K of Each Character From Left and Right
 中等
 You are given a string s consisting of the characters 'a', 'b', and 'c' and a non-negative integer k. Each minute, you may take either the leftmost character of s, or the rightmost character of s.

 Return the minimum number of minutes needed for you to take at least k of each character, or return -1 if it is not possible to take k of each character.

  

 Example 1:

 Input: s = "aabaaaacaabc", k = 2
 Output: 8
 Explanation:
 Take three characters from the left of s. You now have two 'a' characters, and one 'b' character.
 Take five characters from the right of s. You now have four 'a' characters, two 'b' characters, and two 'c' characters.
 A total of 3 + 5 = 8 minutes is needed.
 It can be proven that 8 is the minimum number of minutes needed.
 Example 2:

 Input: s = "a", k = 1
 Output: -1
 Explanation: It is not possible to take one 'b' or 'c' so return -1.
  

 Constraints:

 1 <= s.length <= 105
 s consists of only the letters 'a', 'b', and 'c'.
 0 <= k <= s.length
 */

import Foundation

class Solution {
    func takeCharacters(_ s: String, _ k: Int) -> Int {
        let s = Array(s).map { String($0) }, n = s.count
        var counter = [String: Int]()
        var j = s.count
        while counter["a", default: 0] < k || counter["b", default: 0] < k || counter["c", default: 0] < k {
            if j == 0 {
                return -1
            }
            j -= 1
            counter[s[j]] = counter[s[j], default: 0] + 1
        }
        var ans = n - j
        for (i, char) in s.enumerated() {
            counter[char] = counter[char, default: 0] + 1
            while j < n && counter[s[j], default: 0] > k {
                counter[s[j]] = counter[s[j], default: 0] - 1
                j += 1
            }
            ans = min(ans, i + 1 + n - j)
            if j == n {
                break
            }
        }
        return ans
    }
}

//: [Next](@next)
