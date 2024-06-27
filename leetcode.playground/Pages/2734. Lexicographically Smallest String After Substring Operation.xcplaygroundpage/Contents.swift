//: [Previous](@previous)

/*
 2734. Lexicographically Smallest String After Substring Operation
 中等
 Given a string s consisting of lowercase English letters. Perform the following operation:

 Select any non-empty
 substring
  then replace every letter of the substring with the preceding letter of the English alphabet. For example, 'b' is converted to 'a', and 'a' is converted to 'z'.
 Return the
 lexicographically smallest
  string after performing the operation.

  

 Example 1:

 Input: s = "cbabc"

 Output: "baabc"

 Explanation:

 Perform the operation on the substring starting at index 0, and ending at index 1 inclusive.

 Example 2:

 Input: s = "aa"

 Output: "az"

 Explanation:

 Perform the operation on the last letter.

 Example 3:

 Input: s = "acbbc"

 Output: "abaab"

 Explanation:

 Perform the operation on the substring starting at index 1, and ending at index 4 inclusive.

 Example 4:

 Input: s = "leetcode"

 Output: "kddsbncd"

 Explanation:

 Perform the operation on the entire string.

  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of lowercase English letters
 
 */

import Foundation

class Solution {
    func smallestString(_ s: String) -> String {
        var s = Array(s)
        var started = false
        for (i, char) in s.enumerated() {
            if char != Character("a") {
                if !started {
                    started = true
                }
                s[i] = operation(char)
            } else {
                if started {
                    break
                }
            }
        }
        if !started {
            s[s.count-1] = Character("z")
        }
        return String(s)
    }
    
    func operation(_ char: Character) -> Character {
        if char == Character("a") {
            return Character("z")
        }
        let value = char.asciiValue!
        
        return Character(UnicodeScalar(value - 1))
    }
}

//: [Next](@next)
