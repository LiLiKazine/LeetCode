//: [Previous](@previous)

/*
 249. Group Shifted Strings
 
 We can shift a string by shifting each of its letters to its successive letter.

 For example, "abc" can be shifted to be "bcd".
 We can keep shifting the string to form a sequence.

 For example, we can keep shifting "abc" to form the sequence: "abc" -> "bcd" -> ... -> "xyz".
 Given an array of strings strings, group all strings[i] that belong to the same shifting sequence. You may return the answer in any order.

  

 Example 1:

 Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
 Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]
 Example 2:

 Input: strings = ["a"]
 Output: [["a"]]
  

 Constraints:

 1 <= strings.length <= 200
 1 <= strings[i].length <= 50
 strings[i] consists of lowercase English letters.
 
 */

import Foundation

class Solution {
    
    func groupStrings(_ strings: [String]) -> [[String]] {
        var map = [String: [String]]()
        
        for string in strings {
            var k = "-"
            if string.count > 1 {
                let string = Array(string)
                var v = Int(string[0].asciiValue!)
                for i in 1..<string.count {
                    let __v = Int(string[i].asciiValue!)
                    k += "-"
                    k += String(((__v - v) + 26) % 26)
                    v = __v
                }
            }
            if map[k] == nil {
                map[k] = [string]
            } else {
                map[k]?.append(string)
            }
        }
        return Array(map.values)
        
    }
    
}

//: [Next](@next)
