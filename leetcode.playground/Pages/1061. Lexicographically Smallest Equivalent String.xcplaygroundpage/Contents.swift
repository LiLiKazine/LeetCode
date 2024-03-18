//: [Previous](@previous)

/*
 1061. Lexicographically Smallest Equivalent String
 中等
 You are given two strings of the same length s1 and s2 and a string baseStr.

 We say s1[i] and s2[i] are equivalent characters.

 For example, if s1 = "abc" and s2 = "cde", then we have 'a' == 'c', 'b' == 'd', and 'c' == 'e'.
 Equivalent characters follow the usual rules of any equivalence relation:

 Reflexivity: 'a' == 'a'.
 Symmetry: 'a' == 'b' implies 'b' == 'a'.
 Transitivity: 'a' == 'b' and 'b' == 'c' implies 'a' == 'c'.
 For example, given the equivalency information from s1 = "abc" and s2 = "cde", "acd" and "aab" are equivalent strings of baseStr = "eed", and "aab" is the lexicographically smallest equivalent string of baseStr.

 Return the lexicographically smallest equivalent string of baseStr by using the equivalency information from s1 and s2.

  

 Example 1:

 Input: s1 = "parker", s2 = "morris", baseStr = "parser"
 Output: "makkek"
 Explanation: Based on the equivalency information in s1 and s2, we can group their characters as [m,p], [a,o], [k,r,s], [e,i].
 The characters in each group are equivalent and sorted in lexicographical order.
 So the answer is "makkek".
 Example 2:

 Input: s1 = "hello", s2 = "world", baseStr = "hold"
 Output: "hdld"
 Explanation: Based on the equivalency information in s1 and s2, we can group their characters as [h,w], [d,e,o], [l,r].
 So only the second letter 'o' in baseStr is changed to 'd', the answer is "hdld".
 Example 3:

 Input: s1 = "leetcode", s2 = "programs", baseStr = "sourcecode"
 Output: "aauaaaaada"
 Explanation: We group the equivalent characters in s1 and s2 as [a,o,e,r,s,c], [l,p], [g,t] and [d,m], thus all letters in baseStr except 'u' and 'd' are transformed to 'a', the answer is "aauaaaaada".
  

 Constraints:

 1 <= s1.length, s2.length, baseStr <= 1000
 s1.length == s2.length
 s1, s2, and baseStr consist of lowercase English letters.
 */

import Foundation

class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        let s1 = Array(s1), s2 = Array(s2)
        var indexs = [Character: Int]()
        var characters = [Int: Character]()
        var n = 0
        for c in s1 + s2 {
            if indexs[c] == nil {
                indexs[c] = n
                characters[n] = c
                n += 1
            }
        }
        var union = Array(0..<n)
        
        func connect(_ i: Int, _ j: Int) {
            let realI = find(i)
            let realJ = find(j)
            if characters[realI]! > characters[realJ]! {
                union[realI] = realJ
            } else {
                union[realJ] = realI
            }
            
        }
        
        func find(_ i: Int) -> Int {
            if i == union[i] {
                return i
            }
            union[i] = find(union[i])
            return union[i]
        }

        for i in 0..<s1.count {
            connect(indexs[s1[i]]!, indexs[s2[i]]!)
        }
         var ans = [Character]()
         for c in baseStr {
             if let i = indexs[c] {
                 ans.append(characters[find(i)]!)
             } else {
                 ans.append(c)
             }
         }
         return String(ans)
    }
}

//: [Next](@next)
