//: [Previous](@previous)

/*
 34. Find First and Last Position of Element in Sorted Array
 
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

 Your algorithm's runtime complexity must be in the order of O(log n).

 If the target is not found in the array, return [-1, -1].

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 
 */

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var lo = 0, hi = nums.count - 1
        while lo <= hi {
            let mid = (lo + hi) / 2
            if nums[mid] > target {
                hi = mid - 1
            } else if nums[mid] < target {
                lo = mid + 1
            } else {
                var head = mid, tail = mid
                while head-1 >= 0 && nums[head-1] == nums[mid] {
                    head-=1
                }
                while tail+1 < nums.count && nums[tail+1] == nums[mid] {
                    tail+=1
                }
                return [head, tail]
            }
        }
        return [-1, -1]
    }
}
let test = Solution()
let result = test.searchRange([5,7,7,8,8,10], 8)
//: [Next](@next)
