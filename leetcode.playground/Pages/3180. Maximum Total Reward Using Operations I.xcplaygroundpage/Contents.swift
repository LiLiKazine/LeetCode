//: [Previous](@previous)

/*
 3180. Maximum Total Reward Using Operations I
 中等
 You are given an integer array rewardValues of length n, representing the values of rewards.

 Initially, your total reward x is 0, and all indices are unmarked. You are allowed to perform the following operation any number of times:

 Choose an unmarked index i from the range [0, n - 1].
 If rewardValues[i] is greater than your current total reward x, then add rewardValues[i] to x (i.e., x = x + rewardValues[i]), and mark the index i.
 Return an integer denoting the maximum total reward you can collect by performing the operations optimally.

  

 Example 1:

 Input: rewardValues = [1,1,3,3]

 Output: 4

 Explanation:

 During the operations, we can choose to mark the indices 0 and 2 in order, and the total reward will be 4, which is the maximum.

 Example 2:

 Input: rewardValues = [1,6,4,3,2]

 Output: 11

 Explanation:

 Mark the indices 0, 2, and 1 in order. The total reward will then be 11, which is the maximum.

  

 Constraints:

 1 <= rewardValues.length <= 2000
 1 <= rewardValues[i] <= 2000
 */

import Foundation

class Solution {
    func maxTotalReward(_ rewardValues: [Int]) -> Int {
        let rewardValues = rewardValues.sorted()
        var cache: [Int: Int] = [:]
        
        func dfs(_ index: Int, _ x: Int) -> Int {
            let key = index + x * 1000
            if let ans = cache[key] {
                return ans
            }
            if index == rewardValues.count {
                return x
            }
            let val = rewardValues[index]
            var ans = 0
            if val > x {
                ans = max(dfs(index + 1, x + val), dfs(index + 1, x))
            } else {
                ans = dfs(index + 1, x)
            }
            cache[key] = ans
            return ans
        }
        
        return dfs(0, 0)
    }
}

//: [Next](@next)
