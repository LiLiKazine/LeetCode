//: [Previous](@previous)

/*
 
 494. Target Sum
 
 You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

 Find out how many ways to assign symbols to make sum of integers equal to target S.

 Example 1:
 Input: nums is [1, 1, 1, 1, 1], S is 3.
 Output: 5
 Explanation:

 -1+1+1+1+1 = 3
 +1-1+1+1+1 = 3
 +1+1-1+1+1 = 3
 +1+1+1-1+1 = 3
 +1+1+1+1-1 = 3

 There are 5 ways to assign symbols to make the sum of nums be target 3.
 Note:
 The length of the given array is positive and will not exceed 20.
 The sum of elements in the given array will not exceed 1000.
 Your output answer is guaranteed to be fitted in a 32-bit integer.
 
 */

import Foundation

class Solution {
    
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        let sum = nums.reduce(0, +), dif = sum - S
        
        if dif < 0 || dif % 2 != 0 {
            return 0
        }
        
        let n = nums.count, neg = dif / 2
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: neg + 1), count: n + 1)
        dp[0][0] = 1
        for i in 1...n {
            let num = nums[i - 1]
            for j in 0...neg {
                dp[i][j] = dp[i - 1][j]
                if j >= num {
                    dp[i][j] += dp[i - 1][j - num]
                }
            }
        }
        return dp[n][neg]
    }
    
    private func backTrace(_ val: Int, _ curIndex: Int, _ nums: [Int], _ S: Int) -> Int {
        guard curIndex < nums.count else {
            return val == S ? 1 : 0
        }
        let n1 = backTrace(val + nums[curIndex], curIndex + 1, nums, S),
            n2 = backTrace(val - nums[curIndex], curIndex + 1, nums, S)
        return n1 + n2
    }
}

let nums = [1, 1, 1, 1, 1], S = 3
let solution = Solution()
let ans = solution.findTargetSumWays(nums, S)
ans

//: [Next](@next)
