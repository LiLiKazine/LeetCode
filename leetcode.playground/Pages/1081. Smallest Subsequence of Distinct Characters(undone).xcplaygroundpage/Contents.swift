//: [Previous](@previous)

/*
 
 1081. Smallest Subsequence of Distinct Characters
 
 Return the lexicographically smallest subsequence of s that contains all the distinct characters of s exactly once.

 Note: This question is the same as 316: https://leetcode.com/problems/remove-duplicate-letters/

  

 Example 1:

 Input: s = "bcabc"
 Output: "abc"
 Example 2:

 Input: s = "cbacdcbc"
 Output: "acdb"
  

 Constraints:

 1 <= s.length <= 1000
 s consists of lowercase English letters.
 
 */

class Solution {
    func smallestSubsequence(_ s: String) -> String {
        var s = Array(s), ans: [Int] = Array(repeating: 0, count: 26)
        //97
        for i in 0..<s.count {
            let ordinal = Int(s[i].asciiValue!) - 97
            if ans[ordinal] == 0 {
                ans[ordinal] = i
            } else {
                if ordinal < ans[ordinal] {
                    ans[ordinal] = i
                }
            }
        }
        return ""
    }
}

//: [Next](@next)
