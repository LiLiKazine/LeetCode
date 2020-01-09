//: [Previous](@previous)

/*
 53. Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

 */

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return dp(nums)
    }
    
    func greedy(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var res = nums[0], temp = nums[0]
        for i in 1..<nums.count {
            if temp < 0 {
                temp = nums[i]
            } else {
                temp += nums[i]
            }
            res = max(res, temp)
        }
        return res
    }
    
    func dp(_ nums: [Int]) -> Int {
        var copy = nums, res = copy[0]
        for i in 1..<copy.count {
            if copy[i-1] > 0 {
                copy[i] += copy[i-1]
            }
            res = max(res, copy[i])
        }
        return res
    }
    
    func dc(_ nums: [Int]) -> Int {
        return 0
    }
}
let test = Solution()
let result = test.maxSubArray([-2,1])
//: [Next](@next)
