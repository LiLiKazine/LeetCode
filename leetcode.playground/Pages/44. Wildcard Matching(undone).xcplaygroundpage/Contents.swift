//: [Previous](@previous)

/*
 
 44. Wildcard Matching
 
 Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'.

 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 The matching should cover the entire input string (not partial).

 Note:

 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like ? or *.
 Example 1:

 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input:
 s = "aa"
 p = "*"
 Output: true
 Explanation: '*' matches any sequence.
 Example 3:

 Input:
 s = "cb"
 p = "?a"
 Output: false
 Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
 Example 4:

 Input:
 s = "adceb"
 p = "*a*b"
 Output: true
 Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
 Example 5:

 Input:
 s = "acdcb"
 p = "a*c?b"
 Output: false
 
 */

import Foundation

class Solution {
    var cache: [Key: Bool] = [:]
    func isMatch(_ s: String, _ p: String) -> Bool {
        return recursive(s, p)
    }
    
    func recursive(_ s: String, _ p: String) -> Bool {
        var s = s, p = String([Character](p).reduce([]) { (res, c) -> [Character] in
            if res.last != Character("*") || res.last != c {
                return res + [c]
            }
            return res
        })
        let key = Key(s, p)
        if let rec = cache[key] {
          return rec
        } else if s == p || p == "*" {
            cache[key] = true
        } else if s == "" || p == "" {
            cache[key] = false
        }  else if s.first! == p.first || p.first == Character("?") {
            s.removeFirst()
            p.removeFirst()
            return recursive(s, p)
        } else if p.first == "*" {
            var cp = p, cs = s
            cp.removeFirst()
            cs.removeFirst()
            return recursive(s, cp) || recursive(cs, cp) || recursive(cs, p)
        } else {
            
        }
        return cache[key] == true
    }
    
    struct Key: Hashable {
        var s: String
        var p: String
        init(_ s: String, _ p: String) {
            self.s = s
            self.p = p
        }
    }

}

let test = Solution()
let res = test.isMatch("baaaba", "?*?***")
test.cache
res
//: [Next](@next)
