//: [Previous](@previous)

/*
 
 1047. Remove All Adjacent Duplicates In String
 
 Given a string S of lowercase letters, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.

 We repeatedly make duplicate removals on S until we no longer can.

 Return the final string after all such duplicate removals have been made.  It is guaranteed the answer is unique.

  

 Example 1:

 Input: "abbaca"
 Output: "ca"
 Explanation:
 For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
  

 Note:

 1 <= S.length <= 20000
 S consists only of English lowercase letters.
 
 */

class Solution {
    func removeDuplicates(_ S: String) -> String {
        guard S.count > 1 else {
            return S
        }
        var S = Array(S), i = 0
        while i < S.count {
            if i > 0 && S[i] == S[i - 1] {
                S.remove(at: i - 1)
                S.remove(at: i - 1)
                i -= 1
            } else if i < S.count - 1 && S[i] == S[i + 1] {
                S.remove(at: i)
                S.remove(at: i)
            } else {
                i += 1
            }
        }
        return String(S)
    }
}
let S = "abbaca"
let solution = Solution()
let ans = solution.removeDuplicates(S)
ans

//: [Next](@next)
