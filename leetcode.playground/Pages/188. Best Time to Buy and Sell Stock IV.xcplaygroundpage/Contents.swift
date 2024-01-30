//: [Previous](@previous)

/*
 188. Best Time to Buy and Sell Stock IV
 
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k.

 Find the maximum profit you can achieve. You may complete at most k transactions: i.e. you may buy at most k times and sell at most k times.

 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

  

 Example 1:

 Input: k = 2, prices = [2,4,1]
 Output: 2
 Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.
 Example 2:

 Input: k = 2, prices = [3,2,6,5,0,3]
 Output: 7
 Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4. Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
  

 Constraints:

 1 <= k <= 100
 1 <= prices.length <= 1000
 0 <= prices[i] <= 1000
 
 */

import Foundation

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: k + 1), count: 2), count: prices.count)
        //0没股票 1有股票
        for i in 0...k {
            dp[0][1][i] = -prices[0]
        }
        var ans = 0
        for i in 1..<prices.count {
            let price = prices[i]
            for j in 0...k {
                if j == 0 {
                    dp[i][0][0] = 0
                    dp[i][1][0] = max(dp[i-1][0][0] - price, dp[i-1][1][0])
                } else {
                    dp[i][0][j] = max(dp[i-1][0][j], dp[i-1][1][j-1] + price)
                    dp[i][1][j] = max(dp[i-1][1][j], dp[i-1][0][j] - price)
                }
                ans = max(ans, dp[i][0][k])
            }
        }
        return ans
    }
}

//: [Next](@next)
