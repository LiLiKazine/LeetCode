//: [Previous](@previous)

/*
 217. Contains Duplicate
 Easy

 Given an array of integers, find if the array contains any duplicates.

 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

 Example 1:

 Input: [1,2,3,1]
 Output: true
 Example 2:

 Input: [1,2,3,4]
 Output: false
 Example 3:

 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true
 
 */

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let nums = nums.sorted()
        if nums.count == 0 {
            return false
        }
        for i in 1..<nums.count {
            if nums[i] == nums[i-1] {
                return true
            }
        }
        return false
    }
}

//: [Next](@next)
