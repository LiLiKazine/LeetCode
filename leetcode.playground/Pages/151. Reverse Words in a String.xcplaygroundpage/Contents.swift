//: [Previous](@previous)

/*
 
 151. Reverse Words in a String
 
 Given an input string, reverse the string word by word.

  

 Example 1:

 Input: "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: "  hello world!  "
 Output: "world! hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
  

 Note:

 A word is defined as a sequence of non-space characters.
 Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
 You need to reduce multiple spaces between two words to a single space in the reversed string.
  

 Follow up:

 For C programmers, try to solve it in-place in O(1) extra space.
 
 */

import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {
        var cs = Array<Character>(s)
        var l = 0, r = cs.count-1
        while l <= r {
            if cs[l] == " " {
                l += 1
            } else {
                break
            }
        }
        
        while l <= r {
            if cs[r] == " " {
                r -= 1
            } else {
                break
            }
        }
        guard l <= r else { return "" }
        cs = Array(cs[l...r])
        var words: [String] = []
        while !cs.isEmpty {
            var charSet: [Character] = []
            while !cs.isEmpty {
                let first = cs.removeFirst()
                if first != " " {
                    charSet.append(first)
                } else {
                    break
                }
            }
            if !charSet.isEmpty {
                words.insert(String(charSet), at: 0)
            }
        }
        var word: String = ""
        for w in words {
            word += w
            word += " "
        }
        let _ = word.removeLast()
        return word
    }
}

let solution = Solution()
let ans = solution.reverseWords(" ")

//: [Next](@next)
