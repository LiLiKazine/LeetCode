//: [Previous](@previous)

/*
 540. Single Element in a Sorted Array
 中等
 You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once.

 Return the single element that appears only once.

 Your solution must run in O(log n) time and O(1) space.

  

 Example 1:

 Input: nums = [1,1,2,3,3,4,4,8,8]
 Output: 2
 Example 2:

 Input: nums = [3,3,7,7,10,11,11]
 Output: 10
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 105
 */
// 00 11 2
import Foundation

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count
        var l = 0, r = n
        while l < r {
            let mid = l + (r - l) / 2
            if mid + 1 < n && nums[mid] == nums[mid + 1] {
                if mid % 2 == 0 {
                    l = mid + 1
                } else {
                    r = mid
                }
            } else if mid == 0 || nums[mid - 1] != nums[mid] {
                return nums[mid]
            } else {
                if mid % 2 == 0 {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
        }
        return -1
    }
}

//: [Next](@next)
