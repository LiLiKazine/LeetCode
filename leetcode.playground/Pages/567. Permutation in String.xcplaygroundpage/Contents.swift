//: [Previous](@previous)

/*
 
 567. Permutation in String
 中等
 Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

 In other words, return true if one of s1's permutations is the substring of s2.

  

 Example 1:

 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false
  

 Constraints:

 1 <= s1.length, s2.length <= 104
 s1 and s2 consist of lowercase English letters.
 
 */

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var cnt: [Character: Int] = [:]
        for c in s1 {
            cnt[c] = (cnt[c] ?? 0) + 1
        }
        let s2 = Array(s2)
        var map = [Character: Int](), lo = 0
        for hi in 0..<s2.count {
            map[s2[hi]] = (map[s2[hi]] ?? 0) + 1
            if hi - lo + 1 == s1.count {
                if map == cnt {
                    return true
                }
                map[s2[lo]] = map[s2[lo]]! - 1
                if let n = map[s2[lo]], n == 0 {
                    map.removeValue(forKey: s2[lo])
                }
                lo += 1
            }
        }
        return false
    }
}

let s1 = "ab", s2 = "eidbaooo"
//let s1 = "ab", s2 = "eidboaoo"
let solution = Solution()
let ans = solution.checkInclusion(s1, s2)
ans

//: [Next](@next)
