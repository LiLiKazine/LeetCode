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
        return greedy(nums)
    }
    
    func greedy(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        var i = 0, step = 1
        while i < nums.count && i + nums[i] < nums.count - 1 {
            if nums[i] == 0 {
                break
            }
            i = findMax(i, i+nums[i], nums: nums)
            if i < nums.count-1 {
                step += 1
            }
        }
        return step
    }
    
    func findMax(_ h: Int, _ t: Int, nums: [Int]) -> Int {
        var index = h, max = 0
        for i in h+1...t {
            if nums[i] + i >= max {
                max = nums[i] + i
                index = i
            }
        }
        return index
    }
}

let test = Solution()
let res = test.jump([10,9,8,7,6,5,4,3,2,1,1,0])
res

//: [Next](@next)
