//: [Previous](@previous)
/*
 33. Search in Rotated Sorted Array
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:

 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 */
// 6 7 0 1 2 3 4 5
// 3,4,5,6,7,0,1,2
import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let size = nums.count
        if size < 2 {
            return nums.firstIndex(of: target) ?? -1
        }
        var hi = 0, lo = 1
        while nums[hi] < nums[lo] {
            hi+=1
            lo+=1
            if lo == size {
                break
            }
        }
        var l = 0, h = size-1
        while l <= h {
            let mid = ((l+h)/2 + lo) % size
            if nums[mid] > target {
                h = (l+h)/2-1
            } else if nums[mid] < target {
                l = (l+h)/2+1
            } else {
                return mid
            }
        }
        return -1
    }
}
let test = Solution()
let result = test.search([4,5,6,7,0,1,2], 3)
//: [Next](@next)
