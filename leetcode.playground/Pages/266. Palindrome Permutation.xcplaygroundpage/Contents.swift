//: [Previous](@previous)

/*
 266. Palindrome Permutation
 
 Given a string s, return true if a permutation of the string could form a
 palindrome
  and false otherwise.

  

 Example 1:

 Input: s = "code"
 Output: false
 Example 2:

 Input: s = "aab"
 Output: true
 Example 3:

 Input: s = "carerac"
 Output: true
  

 Constraints:

 1 <= s.length <= 5000
 s consists of only lowercase English letters.
 
 */

import Foundation

class Solution {
    
    func canPermutePalindrome(_ s: String) -> Bool {
        var dict = [Character: Int]()
        for c in s {
            dict[c] = (dict[c] ?? 0) + 1
        }
        var sum = 0
        for value in dict.values {
            sum += (value % 2)
        }
        return sum < 2
    }
    
}

//: [Next](@next)
