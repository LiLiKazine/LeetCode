//: [Previous](@previous)

/*
 287. Find the Duplicate Number
 中等
 Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.

 There is only one repeated number in nums, return this repeated number.

 You must solve the problem without modifying the array nums and uses only constant extra space.

  

 Example 1:

 Input: nums = [1,3,4,2,2]
 Output: 2
 Example 2:

 Input: nums = [3,1,3,4,2]
 Output: 3
 Example 3:

 Input: nums = [3,3,3,3,3]
 Output: 3
  

 Constraints:

 1 <= n <= 105
 nums.length == n + 1
 1 <= nums[i] <= n
 All the integers in nums appear only once except for precisely one integer which appears two or more times.
  

 Follow up:

 How can we prove that at least one duplicate number must exist in nums?
 Can you solve the problem in linear runtime complexity?
 
 */

import Foundation

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count - 1
        var l = 0, r = n, ans = -1
        
        while l <= r {
            let mid = l + (r - l) / 2
            var cnt = 0
            for num in nums {
                if num <= mid {
                    cnt += 1
                }
            }
            if cnt > mid {
                r = mid - 1
                ans = mid
            } else {
                l = mid + 1
            }
        }
        return ans
    }
}

//: [Next](@next)
