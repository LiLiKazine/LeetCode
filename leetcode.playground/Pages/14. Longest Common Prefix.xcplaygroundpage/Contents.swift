//: [Previous](@previous)

/*
 14. Longest Common Prefix
 简单
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

  

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  

 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.
 
 */

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var prefix = "", i = 0
        while true {
            var char = ""
            for str in strs {
                guard i < str.count else {
                    return prefix
                }
                let c = String(str[str.index(str.startIndex, offsetBy: i)])
                if char.isEmpty || char == c {
                    char = c
                } else {
                    return prefix
                }
            }
            prefix += char
            i += 1
        }
    }
}

//: [Next](@next)
