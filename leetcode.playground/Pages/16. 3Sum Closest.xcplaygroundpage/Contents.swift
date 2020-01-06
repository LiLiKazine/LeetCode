//: [Previous](@previous)

/*
 16. 3Sum Closest

 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

 Example:

 Given array nums = [-1, 2, 1, -4], and target = 1.

 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 
 */

import Foundation

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else { return 0 }
        let nums = nums.sorted()
        var diff = Int.max
        var result = [0, 0, 0]
        for i in 0..<nums.count-2 {
            let remain = target - nums[i]
            var head = i + 1
            var tail = nums.count - 1
            while head < tail {
                let sum = remain - nums[head] - nums[tail]
                if abs(diff) > abs(sum) {
                    diff = sum
                    result = [nums[i], nums[head], nums[tail]]
                }
                if nums[head] + nums[tail] > remain {
                    tail -= 1
                } else {
                    head += 1
                }
            }
        }
        return result.reduce(0, +)
    }
}
//let test = Solution()
//let result = test.threeSumClosest(<#T##nums: [Int]##[Int]#>, <#T##target: Int##Int#>)
//: [Next](@next)
