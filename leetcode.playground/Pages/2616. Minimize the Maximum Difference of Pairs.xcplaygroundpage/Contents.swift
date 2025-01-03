//: [Previous](@previous)

/*
 2616. Minimize the Maximum Difference of Pairs
 中等
 You are given a 0-indexed integer array nums and an integer p. Find p pairs of indices of nums such that the maximum difference amongst all the pairs is minimized. Also, ensure no index appears more than once amongst the p pairs.

 Note that for a pair of elements at the index i and j, the difference of this pair is |nums[i] - nums[j]|, where |x| represents the absolute value of x.

 Return the minimum maximum difference among all p pairs. We define the maximum of an empty set to be zero.

  

 Example 1:

 Input: nums = [10,1,2,7,1,3], p = 2
 Output: 1
 Explanation: The first pair is formed from the indices 1 and 4, and the second pair is formed from the indices 2 and 5.
 The maximum difference is max(|nums[1] - nums[4]|, |nums[2] - nums[5]|) = max(0, 1) = 1. Therefore, we return 1.
 Example 2:

 Input: nums = [4,2,1,2], p = 1
 Output: 0
 Explanation: Let the indices 1 and 3 form a pair. The difference of that pair is |2 - 2| = 0, which is the minimum we can attain.
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109
 0 <= p <= (nums.length)/2
 */

import Foundation
//The recurrence relation is fn(i, x) = min(fn(i+1, x), max(abs(nums[i]-nums[i+1]), fn(i+2, p-1)), and fn(0,p) gives the desired answer.
class Solution {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        let nums = nums.sorted(), n = nums.count
        var l = 0, r = nums[n - 1] - nums[0]
        
        func check(_ x: Int) -> Bool {
            var dp = Array(repeating: -1, count: n)
            func dfs(_ i: Int) -> Int {
                if i >= n - 1 {
                    return 0
                }
                if dp[i] != -1 {
                    return dp[i]
                }
                var res = dfs(i + 1)
                if nums[i + 1] - nums[i] <= x {
                    res = max(res, 1 + dfs(i + 2))
                }
                dp[i] = res
                return res
            }
            return dfs(0) >= p
        }
        while l <= r {
            let mid = l + (r - l) / 2
            if check(mid) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}

//: [Next](@next)
