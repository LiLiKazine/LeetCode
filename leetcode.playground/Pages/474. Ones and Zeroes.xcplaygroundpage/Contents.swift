//: [Previous](@previous)

/*
 474. Ones and Zeroes
 
 You are given an array of binary strings strs and two integers m and n.

 Return the size of the largest subset of strs such that there are at most m 0's and n 1's in the subset.

 A set x is a subset of a set y if all elements of x are also elements of y.

  

 Example 1:

 Input: strs = ["10","0001","111001","1","0"], m = 5, n = 3
 Output: 4
 Explanation: The largest subset with at most 5 0's and 3 1's is {"10", "0001", "1", "0"}, so the answer is 4.
 Other valid but smaller subsets include {"0001", "1"} and {"10", "1", "0"}.
 {"111001"} is an invalid subset because it contains 4 1's, greater than the maximum of 3.
 Example 2:

 Input: strs = ["10","0","1"], m = 1, n = 1
 Output: 2
 Explanation: The largest subset is {"0", "1"}, so the answer is 2.
  

 Constraints:

 1 <= strs.length <= 600
 1 <= strs[i].length <= 100
 strs[i] consists only of digits '0' and '1'.
 1 <= m, n <= 100

 */

import Foundation

class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: n+1), count: m+1), count: strs.count + 1)
        var ans = 0
        for i in 1...strs.count {
            let (z, o) = nums(of: strs[i-1])
            for j in 0...m {
                for k in 0...n {
                    dp[i][j][k] = dp[i-1][j][k]
                    if j >= z && k >= o {
                        dp[i][j][k] = max(dp[i][j][k], dp[i-1][j-z][k-o] + 1)
                    }
                }
            }
        }
        
        return dp[strs.count][m][n]
    }
    
    func nums(of str: String) -> (Int, Int) {
        var zeros = 0, ones = 0
        for c in str {
            if c == Character("0") {
                zeros += 1
            }
            if c == Character("1") {
                ones += 1
            }
        }
        return (zeros, ones)
    }
}

//: [Next](@next)
