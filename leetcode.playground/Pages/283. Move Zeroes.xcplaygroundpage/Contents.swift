//: [Previous](@previous)

/*
 283. Move Zeroes
 Easy

 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Example:

 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:

 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.

 */

import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var head = 0, tail = 0
        while head < nums.count {
            if nums[head] == 0 {
                if tail < head {
                    tail = head
                }
                while nums[tail] == 0 {
                    tail += 1
                    if tail == nums.count {
                        return
                    }
                }
                nums[head] += nums[tail]
                nums[tail] = nums[head] - nums[tail]
                nums[head] = nums[head] - nums[tail]
            }
            head += 1
        }
    }
}

//: [Next](@next)
