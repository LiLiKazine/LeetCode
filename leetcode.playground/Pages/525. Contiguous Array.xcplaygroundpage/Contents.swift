//: [Previous](@previous)

/*
 
 525. Contiguous Array
 
 Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

  

 Example 1:

 Input: nums = [0,1]
 Output: 2
 Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
 Example 2:

 Input: nums = [0,1,0]
 Output: 2
 Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
  

 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 
 */

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [0: -1], preSum = 0, ans = 0
        for i in 0..<nums.count {
            let num = nums[i]
            if num == 1 {
                preSum += 1
            } else {
                preSum -= 1
            }
            if let preIndex = map[preSum] {
                ans = max(ans, i - preIndex)
            } else {
                map[preSum] = i
            }
        }
        return ans
    }
}

//: [Next](@next)
