//: [Previous](@previous)

/*
 520. Detect Capital
 简单
 We define the usage of capitals in a word to be right when one of the following cases holds:

 All letters in this word are capitals, like "USA".
 All letters in this word are not capitals, like "leetcode".
 Only the first letter in this word is capital, like "Google".
 Given a string word, return true if the usage of capitals in it is right.

  

 Example 1:

 Input: word = "USA"
 Output: true
 Example 2:

 Input: word = "FlaG"
 Output: false
  

 Constraints:

 1 <= word.length <= 100
 word consists of lowercase and uppercase English letters.
 
 */

import Foundation

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var uppercaseCnt = 0, lowerCaseCnt = 0
        for char in word {
            if char.isWhitespace {
                uppercaseCnt = 0
                lowerCaseCnt = 0
                continue
            }
            if char.isUppercase {
                if lowerCaseCnt > 0 {
                    return false
                }
                uppercaseCnt += 1
            }
            if char.isLowercase {
                if uppercaseCnt > 1 {
                    return false
                }
                lowerCaseCnt += 1
            }
            
        }
        
        return true
    }
}

//: [Next](@next)
