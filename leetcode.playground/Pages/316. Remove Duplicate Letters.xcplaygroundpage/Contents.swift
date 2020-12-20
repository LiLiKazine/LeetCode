//: [Previous](@previous)

/*
 
 316. Remove Duplicate Letters
 
 Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.

 Note: This question is the same as 1081: https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/

  

 Example 1:

 Input: s = "bcabc"
 Output: "abc"
 Example 2:

 Input: s = "cbacdcbc"
 Output: "acdb"
  

 Constraints:

 1 <= s.length <= 104
 s consists of lowercase English letters.
 
 */

class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        let s = Array(s)
        var lastPositions: [Character: Int] = [:], visited: [Character: Bool] = [:], ans: [Character] = []
        for i in 0..<s.count {
            let c = s[i]
            lastPositions[c] = lastPositions[c] == nil ? i : max(lastPositions[c]!, i)
        }
        for i in 0..<s.count {
            let c = s[i]
            if !ans.isEmpty {
                if visited[c] ?? false {
                    continue
                } else if c.asciiValue! < ans.last!.asciiValue! {
                    while !ans.isEmpty && c.asciiValue! < ans.last!.asciiValue! {
                        if lastPositions[ans.last!]! > i  {
                            let removed = ans.removeLast()
                            visited[removed] = false
                        } else {
                            break
                        }
                    }
                }
            }
            ans.append(c)
            visited[c] = true
            
        }
        return String(ans)
    }
}

let solution = Solution()
let ans = solution.removeDuplicateLetters("acbac")
ans

//: [Next](@next)
