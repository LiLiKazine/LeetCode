//: [Previous](@previous)
/*
 345. Reverse Vowels of a String

 Write a function that takes a string as input and reverse only the vowels of a string.

 Example 1:

 Input: "hello"
 Output: "holle"
 Example 2:

 Input: "leetcode"
 Output: "leotcede"
 Note:
 The vowels does not include the letter "y".

 */

import Foundation

class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var characters: [Character] = Array(s)
        var head = 0, tail = s.count - 1
        while head <= tail {
            let h = characters[head]
            let t = characters[tail]
            if vowels.contains(h) && vowels.contains(t) {
                characters[head] = t
                characters[tail] = h
                head += 1
                tail -= 1
            } else if vowels.contains(h) {
                tail -= 1
            } else if vowels.contains(t) {
                head += 1
            } else {
                head += 1
                tail -= 1
            }
        }
        return String(characters)
    }
}
let test = Solution()
let result = test.reverseVowels("aA")

//: [Next](@next)
