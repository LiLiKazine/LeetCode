//: [Previous](@previous)

/*
 72. Edit Distance
 
 Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

 You have the following three operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
  

 Example 1:

 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 Example 2:

 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
  

 Constraints:

 0 <= word1.length, word2.length <= 500
 word1 and word2 consist of lowercase English letters.
 
 */

import Foundation

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty || word2.isEmpty {
            return max(word1.count, word2.count)
        }
        let word1 = word1.map { String($0) }
        let word2 = word2.map { String($0) }
        var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        
        for i in 0..<dp.count {
            for j in 0..<dp[i].count {
                if i == 0 || j == 0 {
                    dp[i][j] = max(i, j)
                    continue
                }
                let val = word1[i-1] == word2[j-1] ? 0 : 1
                dp[i][j] = min(dp[i-1][j] + 1, dp[i][j-1] + 1, dp[i-1][j-1] + val)
            }
        }
        return dp[word1.count][word2.count]
    }
}
let word1 = "horse", word2 = "ros"
//let word1 = "sea" , word2 = "eat"
let solution = Solution()
let ans = solution.minDistance(word1, word2)
//: [Next](@next)
