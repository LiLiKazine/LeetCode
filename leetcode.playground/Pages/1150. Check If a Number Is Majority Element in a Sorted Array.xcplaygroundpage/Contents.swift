//: [Previous](@previous)

/*
 1150. Check If a Number Is Majority Element in a Sorted Array
 简单
 Given an integer array nums sorted in non-decreasing order and an integer target, return true if target is a majority element, or false otherwise.

 A majority element in an array nums is an element that appears more than nums.length / 2 times in the array.

  

 Example 1:

 Input: nums = [2,4,5,5,5,5,5,6,6], target = 5
 Output: true
 Explanation: The value 5 appears 5 times and the length of the array is 9.
 Thus, 5 is a majority element because 5 > 9/2 is true.
 Example 2:

 Input: nums = [10,100,101,101], target = 101
 Output: false
 Explanation: The value 101 appears 2 times and the length of the array is 4.
 Thus, 101 is not a majority element because 2 > 4/2 is false.
  

 Constraints:

 1 <= nums.length <= 1000
 1 <= nums[i], target <= 109
 nums is sorted in non-decreasing order.
 
 */

import Foundation

class Solution {
    func isMajorityElement(_ nums: [Int], _ target: Int) -> Bool {
        let cnt = nums.count
        var lo = 0, hi = cnt - 1
        while hi - lo + 1 > cnt / 2 {
            if nums[lo] == target && nums[hi] == target && hi - lo + 1 > cnt / 2 {
                return true
            }
            if nums[lo] > target {
                return false
            }
            if nums[lo] < target {
                lo += 1
            }
            if nums[hi] < target {
                return false
            }
            if nums[hi] > target {
                hi -= 1
            }
        }
        return false
    }
}

//: [Next](@next)
