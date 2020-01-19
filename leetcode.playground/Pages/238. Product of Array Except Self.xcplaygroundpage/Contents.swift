//: [Previous](@previous)

/*
 238. Product of Array Except Self
 Medium

 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

 Example:

 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Note: Please solve it without division and in O(n).

 Follow up:
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)

 */

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var ans: [Int] = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            ans[i] = ans[i-1] * nums[i-1]
        }
        var r = 1
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            ans[i] = ans[i] * r
            r = r * nums[i]
        }
        return ans
    }
}

//: [Next](@next)
