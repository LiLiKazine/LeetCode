//: [Previous](@previous)

/*
 522. Longest Uncommon Subsequence II
 中等
 Given an array of strings strs, return the length of the longest uncommon subsequence between them. If the longest uncommon subsequence does not exist, return -1.

 An uncommon subsequence between an array of strings is a string that is a subsequence of one string but not the others.

 A subsequence of a string s is a string that can be obtained after deleting any number of characters from s.

 For example, "abc" is a subsequence of "aebdc" because you can delete the underlined characters in "aebdc" to get "abc". Other subsequences of "aebdc" include "aebdc", "aeb", and "" (empty string).
  

 Example 1:

 Input: strs = ["aba","cdc","eae"]
 Output: 3
 Example 2:

 Input: strs = ["aaa","aaa","aa"]
 Output: -1
  

 Constraints:

 2 <= strs.length <= 50
 1 <= strs[i].length <= 10
 strs[i] consists of lowercase English letters.
 
 */

import Foundation

class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        var ans = -1
        for (i, str1) in strs.enumerated() {
            var valid = true
            for (j, str2) in strs.enumerated() {
                if i == j { continue }
                if (str1.count == str2.count && str1 == str2) || (str1.count < str2.count && str1.isSubSequence(of: str2)) {
                    valid = false
                    break
                }
            }
            if valid {
                ans = max(ans, str1.count)
            }
        }
        return ans
    }
}

private extension String {
    func isSubSequence(of str: String) -> Bool {
        let str = Array(str)
        var i = 0
        for char in self {
            while i < str.count && str[i] != char {
                i += 1
            }
            if i == str.count { return false }
            i += 1
        }
        return true
    }
}

//: [Next](@next)
