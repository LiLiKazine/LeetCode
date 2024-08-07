//: [Previous](@previous)

/*
 1658. Minimum Operations to Reduce X to Zero
 中等
 You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.

 Return the minimum number of operations to reduce x to exactly 0 if it is possible, otherwise, return -1.

  

 Example 1:

 Input: nums = [1,1,4,2,3], x = 5
 Output: 2
 Explanation: The optimal solution is to remove the last two elements to reduce x to zero.
 Example 2:

 Input: nums = [5,6,7,8,9], x = 4
 Output: -1
 Example 3:

 Input: nums = [3,2,20,1,1,3], x = 10
 Output: 5
 Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 104
 1 <= x <= 109

 */

import Foundation

class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let len = nums.count, sum = nums.reduce(0, +), target = sum - x
        print(sum, target, x)
        var ans = len + 1, left = 0, cur = 0
        for i in 0..<len {
            cur += nums[i]
            while cur > target {
                cur -= nums[left]
                left += 1
            }
            if cur == target {
                ans = min(ans, len - (i - left + 1))
            }
        }
        return ans > len ? -1 : ans
    }
}

//: [Next](@next)
