//: [Previous](@previous)

/*
 123. Best Time to Buy and Sell Stock III
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 Find the maximum profit you can achieve. You may complete at most two transactions.

 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

  

 Example 1:

 Input: prices = [3,3,5,0,0,3,1,4]
 Output: 6
 Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
 Example 2:

 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
  

 Constraints:

 1 <= prices.length <= 105
 0 <= prices[i] <= 105
 
 */

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: 2), count: prices.count)
        // 0 没股票 1 有股票
        // 交易次数
        dp[0][1][0] = -prices[0]
        dp[0][1][1] = -prices[0]
        dp[0][1][2] = -prices[0]
        var ans = 0
        for i in 1..<prices.count {
            dp[i][0][0] = dp[i-1][0][0]
            dp[i][0][1] = max(dp[i-1][0][1], dp[i-1][1][0] + prices[i])
            dp[i][0][2] = max(dp[i-1][0][2], dp[i-1][1][1] + prices[i])
            dp[i][1][0] = max(dp[i-1][0][0] - prices[i], dp[i-1][1][0])
            dp[i][1][1] = max(dp[i-1][0][1] - prices[i], dp[i-1][1][1])
            ans = max(ans, dp[i][0][0], dp[i][0][1], dp[i][0][2])
        }
        return ans
    }
}

//: [Next](@next)
