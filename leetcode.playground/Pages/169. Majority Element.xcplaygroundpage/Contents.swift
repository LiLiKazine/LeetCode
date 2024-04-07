//: [Previous](@previous)

/*
 
 169. Majority Element
 Easy

 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:

 Input: [3,2,3]
 Output: 3
 Example 2:

 Input: [2,2,1,1,1,2,2]
 Output: 2

 */

import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        var candidate = nums[0], cnt = 1
        for i in 1..<nums.count {
            let n = nums[i]
            if cnt == 0 {
                candidate = n
                cnt = 1
            } else if candidate == n {
                cnt += 1
            } else {
                cnt -= 1
            }
        }
        return candidate
    }
}

//: [Next](@next)
