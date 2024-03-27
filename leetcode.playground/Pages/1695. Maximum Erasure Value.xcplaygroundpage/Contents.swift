//: [Previous](@previous)

/*
 
 1695. Maximum Erasure Value
 中等
 You are given an array of positive integers nums and want to erase a subarray containing unique elements. The score you get by erasing the subarray is equal to the sum of its elements.

 Return the maximum score you can get by erasing exactly one subarray.

 An array b is called to be a subarray of a if it forms a contiguous subsequence of a, that is, if it is equal to a[l],a[l+1],...,a[r] for some (l,r).

  

 Example 1:

 Input: nums = [4,2,4,5,6]
 Output: 17
 Explanation: The optimal subarray here is [2,4,5,6].
 Example 2:

 Input: nums = [5,2,1,2,5,2,1,2,5]
 Output: 8
 Explanation: The optimal subarray here is [5,2,1] or [1,2,5].
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 104
 
 */

import Foundation

class Solution {
 
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        
        var ans = 0, lo = 0

        var sum = 0, set = Set<Int>()
        for hi in 0..<nums.count {
            while set.contains(nums[hi]) {
                sum -= nums[lo]
                set.remove(nums[lo])
                lo += 1
            }
            sum += nums[hi]
            set.insert(nums[hi])
            ans = max(ans, sum)
        }
        
        return ans
    }
    
}

//: [Next](@next)
