//: [Previous](@previous)

/*
 
 844. Backspace String Compare
 
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.

 Example 1:

 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 Example 2:

 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 Example 3:

 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 Example 4:

 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 Note:

 1 <= S.length <= 200
 1 <= T.length <= 200
 S and T only contain lowercase letters and '#' characters.
 Follow up:

 Can you solve it in O(N) time and O(1) space?
 
 */

class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var S = Array(S), T = Array(T), i = 0
        while i < S.count  {
            let c = S[i]
            if c == Character("#") {
                S.remove(at: i)
                if i > 0 {
                    S.remove(at: i-1)
                    i -= 1
                }
                continue
            }
            i += 1
        }
        i = 0
        while i < T.count  {
            let c = T[i]
            if c == Character("#") {
                T.remove(at: i)
                if i > 0 {
                    T.remove(at: i-1)
                    i -= 1
                }
                continue
            }
            i += 1
        }
        return S == T
    }
}

let S = "a##c", T = "#a#c"

let solution = Solution()
let ans = solution.backspaceCompare(S, T)
ans

//: [Next](@next)
