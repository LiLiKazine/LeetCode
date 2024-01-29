//: [Previous](@previous)

/*
 
 309. Best Time to Buy and Sell Stock with Cooldown
 
 Say you have an array for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:

 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
 Example:

 Input: [1,2,3,0,2]
 Output: 3
 Explanation: transactions = [buy, sell, cooldown, buy, sell]
 
 */

class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: prices.count)
        //0 无持股无冷却
        //1 无持股有冷却
        //2 有持股
        dp[0][2] = -prices[0]
        var ans = 0
        for i in 1..<prices.count {
            let price = prices[i]
            dp[i][0] = max(dp[i-1][0], dp[i-1][1])
            dp[i][1] = dp[i-1][0] + price
            dp[i][2] = max(dp[i-1][0] - price, dp[i-1][2])
            ans = max(ans, dp[i][0], dp[i][1], dp[i][2])
        }
       return ans
    }

}

let solution = Solution()
let ans = solution.maxProfit([1,2,3,0,2])
ans
//: [Next](@next)
