//: [Previous](@previous)

/*
 1220. Count Vowels Permutation
 
 Given an integer n, your task is to count how many strings of length n can be formed under the following rules:

 Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
 Each vowel 'a' may only be followed by an 'e'.
 Each vowel 'e' may only be followed by an 'a' or an 'i'.
 Each vowel 'i' may not be followed by another 'i'.
 Each vowel 'o' may only be followed by an 'i' or a 'u'.
 Each vowel 'u' may only be followed by an 'a'.
 Since the answer may be too large, return it modulo 10^9 + 7.

  

 Example 1:

 Input: n = 1
 Output: 5
 Explanation: All possible strings are: "a", "e", "i" , "o" and "u".
 Example 2:

 Input: n = 2
 Output: 10
 Explanation: All possible strings are: "ae", "ea", "ei", "ia", "ie", "io", "iu", "oi", "ou" and "ua".
 Example 3:

 Input: n = 5
 Output: 68
  

 Constraints:

 1 <= n <= 2 * 10^4
 
 */

import Foundation

class Solution {
    func countVowelPermutation(_ n: Int) -> Int {
        let modulo = 1000000000 + 7
        if n == 1 { return 5 }
        var dp = Array(repeating: Array(repeating: 0, count: 5), count: n)
        dp[0] = [1, 1, 1, 1, 1]
        for i in 1..<n {
            dp[i][0] = (dp[i-1][1] + dp[i-1][2] + dp[i-1][4]) % modulo
            dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % modulo
            dp[i][2] = (dp[i-1][1] + dp[i-1][3]) % modulo
            dp[i][3] = dp[i-1][2]
            dp[i][4] = (dp[i-1][2] + dp[i-1][3]) % modulo
        }
        return dp[n-1].reduce(0) {
            return ($0 + $1) % modulo
        }

    }
}


//: [Next](@next)
