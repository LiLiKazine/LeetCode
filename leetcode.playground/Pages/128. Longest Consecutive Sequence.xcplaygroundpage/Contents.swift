//: [Previous](@previous)

/*
 128. Longest Consecutive Sequence
 中等
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

 You must write an algorithm that runs in O(n) time.

  

 Example 1:

 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 Example 2:

 Input: nums = [0,3,7,2,5,8,4,6,0,1]
 Output: 9
  

 Constraints:

 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 
 */

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set(nums)
        var ans = 0
        
        while set.count > 0 {
            let base = set.removeFirst()
            var len = 1
            var offset = 1
            while set.contains(base + offset) {
                set.remove(base + offset)
                offset += 1
                len += 1
            }
            offset = -1
            while set.contains(base + offset) {
                set.remove(base + offset)
                offset -= 1
                len += 1
            }
            ans = max(ans, len)
        }
        return ans
    }
}

//: [Next](@next)
