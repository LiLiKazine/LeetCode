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
        var count = 0
        var candidates: Int? = nil
        for i in 0..<nums.count {
            if count == 0 {
                candidates = nums[i]
            }
            count += candidates! == nums[i] ? 1 : -1
        }
        return candidates!
    }
}

//: [Next](@next)
