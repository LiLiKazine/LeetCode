//: [Previous](@previous)

/*
 186. Reverse Words in a String II
 
 Given a character array s, reverse the order of the words.

 A word is defined as a sequence of non-space characters. The words in s will be separated by a single space.

 Your code must solve the problem in-place, i.e. without allocating extra space.

  

 Example 1:

 Input: s = ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
 Output: ["b","l","u","e"," ","i","s"," ","s","k","y"," ","t","h","e"]
 Example 2:

 Input: s = ["a"]
 Output: ["a"]
  

 Constraints:

 1 <= s.length <= 105
 s[i] is an English letter (uppercase or lowercase), digit, or space ' '.
 There is at least one word in s.
 s does not contain leading or trailing spaces.
 All the words in s are guaranteed to be separated by a single space.
 
 */

import Foundation

class Solution {
    func reverseWords(_ s: inout [Character]) {
        reverse(&s, from: 0, to: s.count)
        var head = -1
        for i in 0..<s.count {
            if s[i] == Character(" ") {
                reverse(&s, from: head + 1, to: i)
                head = i
            }
        }
    }
    
    func reverse(_ s: inout [Character], from: Int, to: Int) {
        var start = from, end = to - 1
        while start > end {
            var tmp = s[start]
            s[start] = s[end]
            s[end] = tmp
            start += 1
            end -= 1
        }
    }
}

//: [Next](@next)
