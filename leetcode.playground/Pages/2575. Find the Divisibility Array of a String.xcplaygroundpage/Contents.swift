//: [Previous](@previous)

/*
 2575. Find the Divisibility Array of a String
 中等
 You are given a 0-indexed string word of length n consisting of digits, and a positive integer m.

 The divisibility array div of word is an integer array of length n such that:

 div[i] = 1 if the numeric value of word[0,...,i] is divisible by m, or
 div[i] = 0 otherwise.
 Return the divisibility array of word.

  

 Example 1:

 Input: word = "998244353", m = 3
 Output: [1,1,0,0,0,1,1,0,0]
 Explanation: There are only 4 prefixes that are divisible by 3: "9", "99", "998244", and "9982443".
 Example 2:

 Input: word = "1010", m = 10
 Output: [0,1,0,1]
 Explanation: There are only 2 prefixes that are divisible by 10: "10", and "1010".
  

 Constraints:

 1 <= n <= 105
 word.length == n
 word consists of digits from 0 to 9
 1 <= m <= 109
 
 */

import Foundation

class Solution {
    func divisibilityArray(_ word: String, _ m: Int) -> [Int] {
        let word = Array(word)
        var div = Array(repeating: 0, count: word.count)
        var num = 0
        for i in 0..<word.count {
            let char = word[i]
            let digit = Int(String(char))!
            num %= m
            num *= 10
            num += digit
            if num % m == 0 {
                div[i] = 1
            }
        }
        return div
    }
}

//: [Next](@next)
