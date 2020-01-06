//: [Previous](@previous)
/*
 18. 4Sum

 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

 Note:

 The solution set must not contain duplicate quadruplets.

 Example:

 Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.

 A solution set is:
 [
   [-1,  0, 0, 1],
   [-2, -1, 1, 2],
   [-2,  0, 0, 2]
 ]
 
 */

import Foundation

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [] }
        let nums = nums.sorted()
        var result: [[Int]] = []
        for i in 0..<nums.count-3 {
            guard i == 0 || nums[i] != nums[i-1] else { continue }
            for j in i+1..<nums.count-2 {
                guard j == i+1 || nums[j] != nums[j-1] else { continue }
                var head = j + 1
                var tail = nums.count - 1
                let remain = target - nums[i] - nums[j]
                while head < tail {
                    if nums[head] + nums[tail] == remain {
                        result.append([nums[i], nums[j], nums[head], nums[tail]])
                        head += 1
                        tail -= 1
                        while head < tail && tail < nums.count-1 && nums[tail] == nums[tail+1] {
                            tail -= 1
                        }
                        while head < tail && head > j+1 && nums[head] == nums[head-1] {
                            head += 1
                        }
                    } else if nums[head] + nums [tail] > remain {
                        tail -= 1
                    } else {
                        head += 1
                    }
                }
            }
        }
        return result
    }
}

//: [Next](@next)
