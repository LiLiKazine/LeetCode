//: [Previous](@previous)

/*
 
 122. Best Time to Buy and Sell Stock II
 
 Say you have an array prices for which the ith element is the price of a given stock on day i.

 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

 Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

 Example 1:

 Input: [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
              Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Example 2:

 Input: [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
              engaging multiple transactions at the same time. You must sell before buying again.
 Example 3:

 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
  

 Constraints:

 1 <= prices.length <= 3 * 10 ^ 4
 0 <= prices[i] <= 10 ^ 4
 
 */

/*
 
 方法一：动态规划
 考虑到「不能同时参与多笔交易」，因此每天交易结束后只可能存在手里有一支股票或者没有股票的状态。

 定义状态 \textit{dp}[i][0]dp[i][0] 表示第 ii 天交易完后手里没有股票的最大利润，\textit{dp}[i][1]dp[i][1] 表示第 ii 天交易完后手里持有一支股票的最大利润（ii 从 00 开始）。

 考虑 \textit{dp}[i][0]dp[i][0] 的转移方程，如果这一天交易完后手里没有股票，那么可能的转移状态为前一天已经没有股票，即 \textit{dp}[i-1][0]dp[i−1][0]，或者前一天结束的时候手里持有一支股票，即 \textit{dp}[i-1][1]dp[i−1][1]，这时候我们要将其卖出，并获得 \textit{prices}[i]prices[i] 的收益。因此为了收益最大化，我们列出如下的转移方程：

 \textit{dp}[i][0]=\max\{\textit{dp}[i-1][0],\textit{dp}[i-1][1]+\textit{prices}[i]\}
 dp[i][0]=max{dp[i−1][0],dp[i−1][1]+prices[i]}

 再来考虑 \textit{dp}[i][1]dp[i][1]，按照同样的方式考虑转移状态，那么可能的转移状态为前一天已经持有一支股票，即 \textit{dp}[i-1][1]dp[i−1][1]，或者前一天结束时还没有股票，即 \textit{dp}[i-1][0]dp[i−1][0]，这时候我们要将其买入，并减少 \textit{prices}[i]prices[i] 的收益。可以列出如下的转移方程：

 \textit{dp}[i][1]=\max\{\textit{dp}[i-1][1],\textit{dp}[i-1][0]-\textit{prices}[i]\}
 dp[i][1]=max{dp[i−1][1],dp[i−1][0]−prices[i]}

 对于初始状态，根据状态定义我们可以知道第 00 天交易结束的时候 \textit{dp}[0][0]=0dp[0][0]=0，\textit{dp}[0][1]=-\textit{prices}[0]dp[0][1]=−prices[0]。

 因此，我们只要从前往后依次计算状态即可。由于全部交易结束后，持有股票的收益一定低于不持有股票的收益，因此这时候 \textit{dp}[n-1][0]dp[n−1][0] 的收益必然是大于 \textit{dp}[n-1][1]dp[n−1][1] 的，最后的答案即为 \textit{dp}[n-1][0]dp[n−1][0]。

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/solution/mai-mai-gu-piao-de-zui-jia-shi-ji-ii-by-leetcode-s/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 方法二：贪心
 由于股票的购买没有限制，因此整个问题等价于寻找 x 个不相交的区间 (l_i,r_i] 使得如下的等式最大化

 \sum_{i=1}^{x} a[r_i]-a[l_i]
 i=1
 ∑
 x
 ​    
  a[r
 i
 ​    
  ]−a[l
 i
 ​    
  ]

 其中 l_il
 i
 ​    
   表示在第 l_il
 i
 ​    
   天买入，r_ir
 i
 ​    
   表示在第 r_ir
 i
 ​    
   天卖出。

 同时我们注意到对于 (l_i,r_i](l
 i
 ​    
  ,r
 i
 ​    
  ] 这一个区间贡献的价值 a[r_i]-a[l_i]a[r
 i
 ​    
  ]−a[l
 i
 ​    
  ]，其实等价于 (l_i,l_i+1],(l_i+1,l_i+2],\ldots,(r_i-1,r_i](l
 i
 ​    
  ,l
 i
 ​    
  +1],(l
 i
 ​    
  +1,l
 i
 ​    
  +2],…,(r
 i
 ​    
  −1,r
 i
 ​    
  ] 这若干个区间长度为 11 的区间的价值和，即

 a[r_i]-a[l_i]=(a[r_i]-a[r_i-1])+(a[r_i-1]-a[r_i-2])+\ldots+(a[l_i+1]-a[l_i])
 a[r
 i
 ​    
  ]−a[l
 i
 ​    
  ]=(a[r
 i
 ​    
  ]−a[r
 i
 ​    
  −1])+(a[r
 i
 ​    
  −1]−a[r
 i
 ​    
  −2])+…+(a[l
 i
 ​    
  +1]−a[l
 i
 ​    
  ])

 因此问题可以简化为找 xx 个长度为 11 的区间 (l_i,l_i+1](l
 i
 ​    
  ,l
 i
 ​    
  +1] 使得 \sum_{i=1}^{x} a[l_i+1]-a[l_i]∑
 i=1
 x
 ​    
  a[l
 i
 ​    
  +1]−a[l
 i
 ​    
  ] 价值最大化。

 贪心的角度考虑我们每次选择贡献大于 00 的区间即能使得答案最大化，因此最后答案为

 \textit{ans}=\sum_{i=1}^{n-1}\max\{0,a[i]-a[i-1]\}
 ans=
 i=1
 ∑
 n−1
 ​    
  max{0,a[i]−a[i−1]}

 其中 nn 为数组的长度。

 需要说明的是，贪心算法只能用于计算最大利润，计算的过程并不是实际的交易过程。

 考虑题目中的例子 [1,2,3,4,5][1,2,3,4,5]，数组的长度 n=5n=5，由于对所有的 1 \le i < n1≤i<n 都有 a[i]>a[i-1]a[i]>a[i−1]，因此答案为

 \textit{ans}=\sum_{i=1}^{n-1}a[i]-a[i-1]=4
 ans=
 i=1
 ∑
 n−1
 ​    
  a[i]−a[i−1]=4

 但是实际的交易过程并不是进行 44 次买入和 44 次卖出，而是在第 11 天买入，第 55 天卖出。

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/solution/mai-mai-gu-piao-de-zui-jia-shi-ji-ii-by-leetcode-s/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let profit = dp(prices)
        return profit
    }
    
    func dp(_ prices: [Int]) -> Int {
        var ans = 0, profits = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
        profits[0][0] = 0
        profits[0][1] = -prices[0]
        for i in 1..<prices.count {
            profits[i][0] = max(profits[i-1][0], profits[i-1][1]+prices[i])
            profits[i][1] = max(profits[i-1][0]-prices[i], profits[i-1][1])
        }
        ans = profits[prices.count-1][0]
        return ans
    }
    
    func greedy(_ prices: [Int]) -> Int {
         var ans = 0
        guard !prices.isEmpty else {
            return ans
        }
        for i in 1..<prices.count {
            ans += max(0, prices[i]-prices[i-1])
        }
        return ans
    }
}

//: [Next](@next)
