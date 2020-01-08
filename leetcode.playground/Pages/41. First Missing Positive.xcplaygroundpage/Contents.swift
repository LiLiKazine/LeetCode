//: [Previous](@previous)

/*
 41. First Missing Positive
 
 Given an unsorted integer array, find the smallest missing positive integer.

 Example 1:

 Input: [1,2,0]
 Output: 3
 Example 2:

 Input: [3,4,-1,1]
 Output: 2
 Example 3:

 Input: [7,8,9,11,12]
 Output: 1
 Note:

 Your algorithm should run in O(n) time and uses constant extra space.

 */

import Foundation

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 0..<nums.count {
            while nums[i] > 0 && nums[i] < nums.count && nums[nums[i]-1] != nums[i] {
                let temp = nums[nums[i]-1]
                nums[nums[i]-1] = nums[i]
                nums[i] = temp
            }
        }
        for i in 0..<nums.count {
            if nums[i] != i+1 {
                return i+1
            }
        }
        return nums.count + 1
    }
}
let test = Solution()
let result = test.firstMissingPositive([])
//: [Next](@next)
