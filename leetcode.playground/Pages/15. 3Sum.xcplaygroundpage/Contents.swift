//: [Previous](@previous)

/*
 15. 3Sum

 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]

 */

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return  [] }
        let nums = nums.sorted()
        var result: [[Int]] = []
        for i in 0..<nums.count-2 {
            guard i == 0 || nums[i] != nums[i-1] else { continue }
            let target = 0 - nums[i]
            var head = i + 1
            var tail = nums.count - 1
            while head < tail {
                if nums[head] + nums[tail] == target {
                    result.append([nums[i], nums[head], nums[tail]])
                    head += 1
                    tail -= 1
                    while head < tail && head > 0 && nums[head] == nums[head-1] {
                        head += 1
                    }
                    while head < tail && tail < nums.count-1 && nums[tail] == nums[tail+1] {
                        tail -= 1
                    }
                } else if nums[head] + nums[tail] > target {
                    tail -= 1
                } else {
                    head += 1
                }
            }
        }
        return result
    }
}

let test = Solution()
let result = test.threeSum([])
//: [Next](@next)
