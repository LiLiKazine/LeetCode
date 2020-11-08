//: [Previous](@previous)

/*
 
 628. Maximum Product of Three Numbers
 
 Given an integer array nums, find three numbers whose product is maximum and return the maximum product.

 Example 1:

 Input: nums = [1,2,3]
 Output: 6
 Example 2:

 Input: nums = [1,2,3,4]
 Output: 24
 Example 3:

 Input: nums = [-1,-2,-3]
 Output: -6
  

 Constraints:

 3 <= nums.length <= 104
 -1000 <= nums[i] <= 1000
 
 */

class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        guard nums.count > 3 else {
            return nums.reduce(1, *)
        }
        var nums = nums.sorted(by: <), count = nums.count
        let ans = max(nums[0] * nums[1] * nums[count-1], nums[count-3] * nums[count-2] * nums[count-1])
        return ans
    }
}

//: [Next](@next)
