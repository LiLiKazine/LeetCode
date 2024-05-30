//: [Previous](@previous)

/*
 394. Decode String
 中等
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].

 The test cases are generated so that the length of the output will never exceed 105.

  

 Example 1:

 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 Example 2:

 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 Example 3:

 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
  

 Constraints:

 1 <= s.length <= 30
 s consists of lowercase English letters, digits, and square brackets '[]'.
 s is guaranteed to be a valid input.
 All the integers in s are in the range [1, 300].

 */

import Foundation

class Solution {
    func decodeString(_ s: String) -> String {
        let s = Array(s).map { String($0) }
        var stack = [String]()
        var i = 0, j = 0
        while i < s.count {
            while j < s.count, isChar(s[j]) {
                j += 1
            }
            if j > i {
                stack.append(s[i..<j].joined())
                i = j
            }
            while j < s.count && s[j] != "[" && s[j] != "]" {
                j += 1
            }
            if j < s.count && s[j] == "[" {
                stack.append(s[i..<j].joined())
                j += 1
                i = j
            } else {
                if j > i {
                    if let last = stack.last, let cnt = Int(last) {
                        stack.popLast()
                        let str = Array(repeating: s[i..<j].joined(), count: cnt).joined()
                        stack.append(str)
                    } else {
                        stack.append(s[i..<j].joined())
                    }
                } else {
                    var str = stack.popLast()!
                    while let last = stack.popLast() {
                        if let cnt = Int(last) {
                            str = Array(repeating: str, count: cnt).joined()
                            break
                        } else {
                            str = last + str
                        }
                    }
                    stack.append(str)
                }
                j += 1
                i = j
            }
        }
        return stack.joined()
    }
    
    func isChar(_ str: String) -> Bool {
        return Int(str) == nil && str != "[" && str != "]"
    }
}

//: [Next](@next)
