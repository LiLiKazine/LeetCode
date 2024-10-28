//: [Previous](@previous)

/*
 1802. Maximum Value at a Given Index in a Bounded Array
 中等
 You are given three positive integers: n, index, and maxSum. You want to construct an array nums (0-indexed) that satisfies the following conditions:

 nums.length == n
 nums[i] is a positive integer where 0 <= i < n.
 abs(nums[i] - nums[i+1]) <= 1 where 0 <= i < n-1.
 The sum of all the elements of nums does not exceed maxSum.
 nums[index] is maximized.
 Return nums[index] of the constructed array.

 Note that abs(x) equals x if x >= 0, and -x otherwise.

  

 Example 1:

 Input: n = 4, index = 2,  maxSum = 6
 Output: 2
 Explanation: nums = [1,2,2,1] is one array that satisfies all the conditions.
 There are no arrays that satisfy all the conditions and have nums[2] == 3, so 2 is the maximum nums[2].
 Example 2:

 Input: n = 6, index = 1,  maxSum = 10
 Output: 3
  

 Constraints:

 1 <= n <= maxSum <= 109
 0 <= index < n
 */

import Foundation

class Solution {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        var l = 1, r = maxSum
        
        func isValid(_ x: Int) -> Bool {
            func sum(_ cnt: Int) -> Int {
                var total = 0
                let k = cnt - x
                total += max(k, 0)
                total += (max(1, x - cnt + 1) + x) * (cnt - max(k, 0)) / 2
                return total
            }
            let total = sum(index + 1) + sum(n - index) - x
            return total <= maxSum
        }
        while l <= r {
            let mid = l + (r - l) / 2
            if isValid(mid) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return r
    }
}

//: [Next](@next)
