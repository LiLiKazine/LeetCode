//: [Previous](@previous)

/*
 256. Paint House
 
 There is a row of n houses, where each house can be painted one of three colors: red, blue, or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

 The cost of painting each house with a certain color is represented by an n x 3 cost matrix costs.

 For example, costs[0][0] is the cost of painting house 0 with the color red; costs[1][2] is the cost of painting house 1 with color green, and so on...
 Return the minimum cost to paint all houses.

  

 Example 1:

 Input: costs = [[17,2,17],[16,16,5],[14,3,19]]
 Output: 10
 Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue.
 Minimum cost: 2 + 5 + 3 = 10.
 Example 2:

 Input: costs = [[7,6,2]]
 Output: 2
  

 Constraints:

 costs.length == n
 costs[i].length == 3
 1 <= n <= 100
 1 <= costs[i][j] <= 20
 
 */

import Foundation

class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        if costs.count == 1 {
            return min(costs[0][0], costs[0][1], costs[0][2])
        }
        var dp = Array(repeating: [0, 0, 0], count: costs.count + 1)
        dp[1] = costs[0]
        for i in 2...costs.count {
            let nums = costs[i-1]
            dp[i][0] = min(dp[i-1][1] + nums[0], dp[i-1][2] + nums[0])
            dp[i][1] = min(dp[i-1][0] + nums[1], dp[i-1][2] + nums[1])
            dp[i][2] = min(dp[i-1][0] + nums[2], dp[i-1][1] + nums[2])
        }
        let last = dp[costs.count]
        return min(last[0], last[1], last[2])
    }
}

//: [Next](@next)
