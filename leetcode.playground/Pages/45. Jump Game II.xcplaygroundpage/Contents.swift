//: [Previous](@previous)

/*
 45. Jump Game II
 
 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Your goal is to reach the last index in the minimum number of jumps.

 Example:

 Input: [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2.
     Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Note:

 You can assume that you can always reach the last index.

 */

import Foundation

class Solution {
    func jump(_ nums: [Int]) -> Int {
        let steps = greedy(nums)
        return steps
    }
    
    func greedy(_ nums: [Int]) -> Int {
        var jumps = 0, curEnd = 0, farthest = 0
        for i in 0..<nums.count-1 {
            farthest = max(farthest, i + nums[i])
            if i == curEnd {
                jumps += 1
                curEnd = farthest
            }
        }
        return jumps
    }
    
    func backTracing(_ heads: [Int], _ nums: [Int]) -> [Int] {
        let target = nums.count - 1
        if target == 0 {
            return heads
        }
        let gap = target - nums[0]
        if gap <= 0 {
            return heads + [nums[0]]
        }
        if gap > 0 {
            if nums[0] == 0 {
                return []
            }
            var shortest: [Int] = []
            for i in 1...nums[0] {
                let tail = backTracing(heads + [nums[i]], Array(nums[i..<nums.count]))
                if tail.count > 0 && (shortest.count == 0 || shortest.count > tail.count) {
                    shortest = tail
                }
            }
            if shortest.count > 0 {
                return shortest
            }
        }
        return []
    }
}
let test = Solution()
let result = test.jump([5,6,4,4,6,9,4,4,7,4,4,8,2,6,8,1,5,9,6,5,2,7,9,7,9,6,9,4,1,6,8,8,4,4,2,0,3,8,5])
//: [Next](@next)
