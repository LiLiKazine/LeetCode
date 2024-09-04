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
        let n = nums.count
        
        func lowerBound(_ target: Int) -> Int {
            var l = 0, r = n
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
        
        func upperBound(_ target: Int) -> Int {
            var l = 0, r = n - 1
            while l <= r {
                let mid = l + (r - l) / 2
                if nums[mid] > target {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            return r
        }
        let l = lowerBound(target)
        if l == n || nums[l] != target {
            return [-1, -1]
        }
        let r = upperBound(target)
        return [l, r]
        
    }
}

let test = Solution()
let result = test.searchRange([5,7,7,8,8,10], 8)
//: [Next](@next)
