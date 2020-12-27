//: [Previous](@previous)

/*
 
 205. Isomorphic Strings
 
 Given two strings s and t, determine if they are isomorphic.

 Two strings are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

 Example 1:

 Input: s = "egg", t = "add"
 Output: true
 Example 2:

 Input: s = "foo", t = "bar"
 Output: false
 Example 3:

 Input: s = "paper", t = "title"
 Output: true
 Note:
 You may assume both s and t have the same length.
 
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        var cache1: [Character: Int] = [:], cache2: [Character: Int] = [:],
            flag = 0,
            s = Array(s), t = Array(t)
        for i in 0..<s.count {
            let cs = s[i], ct = t[i]
            if let i1 = cache1[cs], let i2 = cache2[ct], i1 == i2 {
                continue
            } else if cache1[cs] == nil && cache2[ct] == nil {
                cache1[cs] = flag
                cache2[ct] = flag
                flag += 1
            } else {
                return false
            }
        }
        return true
    }
}

//: [Next](@next)
