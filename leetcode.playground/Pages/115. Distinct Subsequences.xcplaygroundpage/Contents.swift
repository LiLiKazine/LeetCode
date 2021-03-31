//: [Previous](@previous)

/*
 
 115. Distinct Subsequences
 
 Given a string S and a string T, count the number of distinct subsequences of S which equals T.

 A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ACE" is a subsequence of "ABCDE" while "AEC" is not).

 It's guaranteed the answer fits on a 32-bit signed integer.

 Example 1:

 Input: S = "rabbbit", T = "rabbit"
 Output: 3
 Explanation:
 As shown below, there are 3 ways you can generate "rabbit" from S.
 (The caret symbol ^ means the chosen letters)

 rabbbit
 ^^^^ ^^
 rabbbit
 ^^ ^^^^
 rabbbit
 ^^^ ^^^
 Example 2:

 Input: S = "babgbag", T = "bag"
 Output: 5
 Explanation:
 As shown below, there are 5 ways you can generate "bag" from S.
 (The caret symbol ^ means the chosen letters)

 babgbag
 ^^ ^
 babgbag
 ^^    ^
 babgbag
 ^    ^^
 babgbag
   ^  ^^
 babgbag
     ^^^
 
 */

/*
 
 class Solution {
 public:
     int numDistinct(string s, string t) {
         int m = s.length(), n = t.length();
         if (m < n) {
             return 0;
         }
         vector<vector<long>> dp(m + 1, vector<long>(n + 1));
         for (int i = 0; i <= m; i++) {
             dp[i][n] = 1;
         }
         for (int i = m - 1; i >= 0; i--) {
             char sChar = s.at(i);
             for (int j = n - 1; j >= 0; j--) {
                 char tChar = t.at(j);
                 if (sChar == tChar) {
                     dp[i][j] = dp[i + 1][j + 1] + dp[i + 1][j];
                 } else {
                     dp[i][j] = dp[i + 1][j];
                 }
             }
         }
         return dp[0][0];
     }
 };
 
 */

import Foundation

class Solution {
    
    func numDistinct(_ s: String, _ t: String) -> Int {
        let s = Array(s), t = Array(t), m = s.count, n = t.count
        guard m >= n else {
            return 0
        }
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 0...m {
            dp[i][n] = 1
        }
        for i in stride(from: m - 1, to: -1, by: -1) {
            let sc = s[i]
            for j in stride(from: n - 1, to: -1, by: -1) {
                let tc = t[j]
                if sc == tc {
                    dp[i][j] = dp[i + 1][j + 1] + dp[i + 1][j]
                } else {
                    dp[i][j] = dp[i + 1][j]
                }
            }
        }
        return dp[0][0]
    }
}

/* exceeded time
class Solution {
    
    var temp: [Character] = []
    var ans: Int = 0
    var s: [Character] = []
    var t: [Character] = []
    
    func numDistinct(_ s: String, _ t: String) -> Int {
        self.s = Array(s)
        self.t = Array(t)
        recursive(cur: 0)
        return ans
    }
    
    private func recursive(cur: Int) {
        if temp == t {
            ans += 1
            return
        }
        if cur >= s.count || temp.count >= t.count {
            return
        }
        recursive(cur: cur + 1)
        if cur >= s.count || s[cur] != t[temp.count] {
            return
        }
        temp.append(s[cur])
        recursive(cur: cur + 1)
        temp.popLast()
        
    }
}
*/

let S = "aabdbaabeeadcbbdedacbbeecbabebaeeecaeabaedadcbdbcdaabebdadbbaeabdadeaabbabbecebbebcaddaacccebeaeedababedeacdeaaaeeaecbe", T = "bddabdcae"
//let S = "babgbag", T = "bag"
//let S = "rabbbit", T = "rabbit"
let solution = Solution()
let ans = solution.numDistinct(S, T)
ans

//: [Next](@next)
