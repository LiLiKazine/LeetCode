//: [Previous](@previous)

/*
 344. Reverse String

 Write a function that reverses a string. The input string is given as an array of characters char[].

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 You may assume all the characters consist of printable ascii characters.

  

 Example 1:

 Input: ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]

 */

import Foundation

class Solution {
    func reverseString(_ s: inout [Character]) {
        var head = 0, tail = s.count - 1
        while head <= tail {
            let temp = s[head]
            s[head] = s[tail]
            s[tail] = temp
            head += 1
            tail -= 1
        }
    }
}

let test = Solution()
var input: [Character] = ["h","e","l","l","o"]
test.reverseString(&input)
//: [Next](@next)
