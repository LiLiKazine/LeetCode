//: [Previous](@previous)

/*
 686. Repeated String Match
 中等
 Given two strings a and b, return the minimum number of times you should repeat string a so that string b is a substring of it. If it is impossible for b​​​​​​ to be a substring of a after repeating it, return -1.

 Notice: string "abc" repeated 0 times is "", repeated 1 time is "abc" and repeated 2 times is "abcabc".

  

 Example 1:

 Input: a = "abcd", b = "cdabcdab"
 Output: 3
 Explanation: We return 3 because by repeating a three times "abcdabcdabcd", b is a substring of it.
 Example 2:

 Input: a = "a", b = "aa"
 Output: 2
  

 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist of lowercase English letters.
 
 */

import Foundation

class Solution {
    func repeatedStringMatch(_ a: String, _ b: String) -> Int {
        if b.isEmpty { return 0 }
        let a = Array(a), b = Array(b)
        let time = (b.count / a.count) + (b.count % a.count > 1 ? 2 : 1)

        var lo = 0, j = 0
        
        while lo < a.count * time {
            while lo < a.count * time && a[lo % a.count] != b[j] {
                lo += 1
            }
            var i = lo
            while a[i % a.count] == b[j] {
                i += 1
                j += 1
                if j == b.count {
                    return i / a.count + (i % a.count == 0 ? 0 : 1)
                }
            }
            lo += 1
            j = 0
        }
        return -1
    }
}

//: [Next](@next)
