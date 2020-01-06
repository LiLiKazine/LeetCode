/*
 1. Two Sum

 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            let remain = target - nums[i]
            for j in i+1..<nums.count {
                if remain == nums[j] {
                    return [i, j]
                }
            }
        }
        return []
    }
}

let test = Solution()
let result = test.twoSum([2, 7, 11, 15], 9)
