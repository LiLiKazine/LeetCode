//: [Previous](@previous)

/*
 
 879. Profitable Schemes
 
 There is a group of n members, and a list of various crimes they could commit. The ith crime generates a profit[i] and requires group[i] members to participate in it. If a member participates in one crime, that member can't participate in another crime.

 Let's call a profitable scheme any subset of these crimes that generates at least minProfit profit, and the total number of members participating in that subset of crimes is at most n.

 Return the number of schemes that can be chosen. Since the answer may be very large, return it modulo 10 ^ 9 + 7.

  

 Example 1:

 Input: n = 5, minProfit = 3, group = [2,2], profit = [2,3]
 Output: 2
 Explanation: To make a profit of at least 3, the group could either commit crimes 0 and 1, or just crime 1.
 In total, there are 2 schemes.
 Example 2:

 Input: n = 10, minProfit = 5, group = [2,3,5], profit = [6,7,8]
 Output: 7
 Explanation: To make a profit of at least 5, the group could commit any crimes, as long as they commit one.
 There are 7 possible schemes: (0), (1), (2), (0,1), (0,2), (1,2), and (0,1,2).
  

 Constraints:

 1 <= n <= 100
 0 <= minProfit <= 100
 1 <= group.length <= 100
 1 <= group[i] <= 100
 profit.length == group.length
 0 <= profit[i] <= 100
 
 */

class Solution {
    func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        let mod = 1000000000 + 7
        var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: minProfit + 1), count: n + 1), count: profit.count + 1)
        dp[0][0][0] = 1
        for i in 1...profit.count {
            let mem = group[i - 1], earn = profit[i - 1]
            for j in 0...n {
                for k in 0...minProfit {
                    if j < mem {
                        dp[i][j][k] = dp[i - 1][j][k]
                    } else {
                        dp[i][j][k] = (dp[i - 1][j][k] + dp[i - 1][j - mem][max(0, k - earn)]) % mod
                    }
                }
            }
        }
        var sum = 0
        for j in 0...n {
            sum = (sum + dp[profit.count][j][minProfit]) % mod
        }
        return sum
    }
}

let n = 10, minProfit = 5, group = [2,3,5], profit = [6,7,8]
let solution = Solution()
let ans = solution.profitableSchemes(n, minProfit, group, profit)
ans

//: [Next](@next)
