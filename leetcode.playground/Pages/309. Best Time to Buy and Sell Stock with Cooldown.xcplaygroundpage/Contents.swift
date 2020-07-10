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

/*
 
 fiA: 第i天结束持有1只股票
 fiB: 第i天结束没有股票
 fiC: 第i天结束处于冷却(第i天卖了股票)
 
 maxi = max(fiA, fiB, fiC)
 
 fiA = max(f[i-1]B - prices[i], f[i-1]A)
 fiB = max(f[i-1]C, f[i-1]B)
 fiC = max(f[i-1]A + prices[i])
 
 */
class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var rec: [Int] = [0, 0, 0]
        for i in 0..<prices.count {
            if i == 0 {
                rec = [-prices[i], 0, 0]
            } else {
                let fa = rec[0], fb = rec[1], fc = rec[2]
                rec[0] = max(fa, fb - prices[i])
                rec[1] = i == 1 ? fb : max(fc, fb)
                rec[2] = fa + prices[i]
            }
        }
        
        return max(rec[0], rec[1], rec[2])
    }

}

let solution = Solution()
let ans = solution.maxProfit([1,2,3,0,2])
ans
//: [Next](@next)
