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

/*
 s =
 "badc"
 t =
 "baba"
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var map = [Character: Character](), used = Set<Character>()
        let s = Array(s), t = Array(t)
        for i in 0..<s.count {
            let charS = s[i], charT = t[i]
            if let char = map[charS] {
                if char != charT {
                    return false
                }
            } else if used.contains(charT) {
                return false
            } else {
                map[charS] = charT
                used.insert(charT)
            }
        }
        return true
    }
}

//: [Next](@next)
