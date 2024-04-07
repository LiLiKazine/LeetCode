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
        let end = nums.count - 1
        var cur = 0, steps = 0
        var i = 0
        while i < nums.count {
            if cur >= end {
                return steps
            }
            var next = cur
            while i <= cur {
                next = max(next, i + nums[i])
                i += 1
            }
            if next > cur {
                cur = next
                steps += 1
            }
        }
        return steps
    }
}

let test = Solution()
let result = test.jump([5,6,4,4,6,9,4,4,7,4,4,8,2,6,8,1,5,9,6,5,2,7,9,7,9,6,9,4,1,6,8,8,4,4,2,0,3,8,5])
//: [Next](@next)
