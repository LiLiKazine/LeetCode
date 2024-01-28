//: [Previous](@previous)

/*
 673. Number of Longest Increasing Subsequence
 
 Given an integer array nums, return the number of longest increasing subsequences.

 Notice that the sequence has to be strictly increasing.

  

 Example 1:

 Input: nums = [1,3,5,4,7]
 Output: 2
 Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].
 Example 2:

 Input: nums = [2,2,2,2,2]
 Output: 5
 Explanation: The length of the longest increasing subsequence is 1, and there are 5 increasing subsequences of length 1, so output 5.
  

 Constraints:

 1 <= nums.length <= 2000
 -106 <= nums[i] <= 106

 */

import Foundation

class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 1, count: nums.count)
        var cnt = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    if dp[j] + 1 > dp[i] {
                        cnt[i] = cnt[j]
                        dp[i] = dp[j] + 1
                    } else if dp[j] + 1 == dp[i] {
                        cnt[i] += cnt[j]
                    }
                }
            }
        }
        var curLen = 0, ans = 0
        for i in 0..<dp.count {
            if dp[i] > curLen {
                curLen = dp[i]
                ans = 0
                ans += cnt[i]
            } else if dp[i] == curLen {
                ans += cnt[i]
            }
        }
        return ans
    }
}


//: [Next](@next)
