//: [Previous](@previous)

/*
 1493. Longest Subarray of 1's After Deleting One Element
 中等
 Given a binary array nums, you should delete one element from it.

 Return the size of the longest non-empty subarray containing only 1's in the resulting array. Return 0 if there is no such subarray.

  

 Example 1:

 Input: nums = [1,1,0,1]
 Output: 3
 Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.
 Example 2:

 Input: nums = [0,1,1,1,0,1,1,0,1]
 Output: 5
 Explanation: After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].
 Example 3:

 Input: nums = [1,1,1]
 Output: 2
 Explanation: You must delete one element.
  

 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 
 */

import Foundation

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        
        var ans = 0, cur = 0, j = -1
        
        for (i, num) in nums.enumerated() {
            if num == 1 {
                cur += 1
                ans = max(ans, cur)
            } else if j < 0 {
                j = i
            } else {
                cur = i - j - 1
                j = i
            }
        }
        return ans == nums.count ? ans - 1 : ans
    }
}

//: [Next](@next)
