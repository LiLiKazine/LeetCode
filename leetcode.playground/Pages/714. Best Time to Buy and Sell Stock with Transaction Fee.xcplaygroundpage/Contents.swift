//: [Previous](@previous)

/*
 
 714. Best Time to Buy and Sell Stock with Transaction Fee
 
 Your are given an array of integers prices, for which the i-th element is the price of a given stock on day i; and a non-negative integer fee representing a transaction fee.

 You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction. You may not buy more than 1 share of a stock at a time (ie. you must sell the stock share before you buy again.)

 Return the maximum profit you can make.

 Example 1:
 Input: prices = [1, 3, 2, 8, 4, 9], fee = 2
 Output: 8
 Explanation: The maximum profit can be achieved by:
 Buying at prices[0] = 1
 Selling at prices[3] = 8
 Buying at prices[4] = 4
 Selling at prices[5] = 9
 The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
 Note:

 0 < prices.length <= 50000.
 0 < prices[i] < 50000.
 0 <= fee < 50000.
 
 */

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
        //0 有股票
        //1 没股票
        dp[0][0] = -prices[0] - fee
        var ans = 0
        for i in 1..<prices.count {
            dp[i][0] = max(dp[i-1][0], dp[i-1][1] - prices[i] - fee)
            dp[i][1] = max(dp[i-1][0] + prices[i] - fee, dp[i-1][1])
            ans = max(ans, dp[i][0], dp[i][1])
        }
        return ans
    }
}

let prices = [1, 3, 2, 8, 4, 9], fee = 2
let solution = Solution()
let ans = solution.maxProfit(prices, fee)
ans

//: [Next](@next)
