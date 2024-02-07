//: [Previous](@previous)

/*
 487. Max Consecutive Ones II
 
 Given a binary array nums, return the maximum number of consecutive 1's in the array if you can flip at most one 0.

  

 Example 1:

 Input: nums = [1,0,1,1,0]
 Output: 4
 Explanation:
 - If we flip the first zero, nums becomes [1,1,1,1,0] and we have 4 consecutive ones.
 - If we flip the second zero, nums becomes [1,0,1,1,1] and we have 3 consecutive ones.
 The max number of consecutive ones is 4.
 Example 2:

 Input: nums = [1,0,1,1,0,1]
 Output: 4
 Explanation:
 - If we flip the first zero, nums becomes [1,1,1,1,0,1] and we have 4 consecutive ones.
 - If we flip the second zero, nums becomes [1,0,1,1,1,1] and we have 4 consecutive ones.
 The max number of consecutive ones is 4.
  

 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
  

 Follow up: What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently?

 */

import Foundation

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var l = 0, r = 0, ans = 0
        var z: Int?
        while r < nums.count {
            if nums[r] == 0 {
                if let __z = z  {
                    l = __z + 1
                }
                z = r
            }
            r += 1
            ans = max(ans, r - l)
        }
        return ans
    }
}

//: [Next](@next)
