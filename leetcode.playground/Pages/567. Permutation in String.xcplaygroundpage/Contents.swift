//: [Previous](@previous)

/*
 
 567. Permutation in String
 
 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

  

 Example 1:

 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
  

 Constraints:

 The input strings only contain lower case letters.
 The length of both given strings is in range [1, 10,000].
 
 */

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var dict: [Character: Int] = [:]
        for c in s1 {
            dict[c] = (dict[c] ?? 0) + 1
        }
        var left = 0, right = 0, s2 = Array(s2)
        while right < s2.count {
            let c = s2[right]
            if dict[c] != nil && dict[c]! > 0 {
                right += 1
                dict[c]! -= 1
            } else {
                let c = s2[left]
                dict[c] = (dict[c] ?? 0) + 1
                left += 1
            }
            
            if right - left == s1.count {
                return true
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
