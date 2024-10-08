//: [Previous](@previous)

/*
 35. Search Insert Position
 
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You may assume no duplicates in the array.

 Example 1:

 Input: [1,3,5,6], 5
 Output: 2
 Example 2:

 Input: [1,3,5,6], 2
 Output: 1
 Example 3:

 Input: [1,3,5,6], 7
 Output: 4
 Example 4:

 Input: [1,3,5,6], 0
 Output: 0
 
 */

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }
}

//: [Next](@next)
