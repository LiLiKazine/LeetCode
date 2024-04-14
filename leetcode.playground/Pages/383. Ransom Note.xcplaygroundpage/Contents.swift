//: [Previous](@previous)

/*
 383. Ransom Note
 简单
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

 Each letter in magazine can only be used once in ransomNote.

  

 Example 1:

 Input: ransomNote = "a", magazine = "b"
 Output: false
 Example 2:

 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 Example 3:

 Input: ransomNote = "aa", magazine = "aab"
 Output: true
  

 Constraints:

 1 <= ransomNote.length, magazine.length <= 105
 ransomNote and magazine consist of lowercase English letters.
 */

import Foundation

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dictionay = [Character: Int]()
        for char in magazine {
            dictionay[char] = (dictionay[char] ?? 0) + 1
        }
        for char in ransomNote {
            guard let cnt = dictionay[char], cnt > 0 else { return false }
            dictionay[char] = (cnt - 1)
        }
        return true
    }
}

//: [Next](@next)
