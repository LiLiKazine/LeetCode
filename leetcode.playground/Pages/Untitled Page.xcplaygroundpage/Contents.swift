//: [Previous](@previous)

/*
 1055. Shortest Way to Form String
 
 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 Given two strings source and target, return the minimum number of subsequences of source such that their concatenation equals target. If the task is impossible, return -1.

  

 Example 1:

 Input: source = "abc", target = "abcbc"
 Output: 2
 Explanation: The target "abcbc" can be formed by "abc" and "bc", which are subsequences of source "abc".
 Example 2:

 Input: source = "abc", target = "acdbc"
 Output: -1
 Explanation: The target string cannot be constructed from the subsequences of source string due to the character "d" in target string.
 Example 3:

 Input: source = "xyz", target = "xzyxz"
 Output: 3
 Explanation: The target string can be constructed as follows "xz" + "y" + "xz".
  

 Constraints:

 1 <= source.length, target.length <= 1000
 source and target consist of lowercase English letters.
 
 */

import Foundation

class Solution {
    func shortestWay(_ source: String, _ target: String) -> Int {
        
        let target = Array(target)
        var k = 0, source = Array(source)
        let step = source
        
        var dict = [Character: Bool]()
        for c in source {
            dict[c] = true
        }
        for c in target {
            if dict[c] == nil {
                return -1
            }
        }
        
        while true {
            if isSub(source, target) {
                return k + 1
            }
            source += step
            k += 1
        }
    }
    
    func isSub(_ source: [Character], _ target: [Character]) -> Bool {
        var i = 0, j = 0
        
        while i < source.count, j < target.count {
            if source[i] == target[j] {
                j += 1
            }
            i += 1
        }
        return j == source.count
        
    }
}

//: [Next](@next)
