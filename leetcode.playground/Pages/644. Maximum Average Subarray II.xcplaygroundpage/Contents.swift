//: [Previous](@previous)

/*
 644. Maximum Average Subarray II
 困难
 You are given an integer array nums consisting of n elements, and an integer k.

 Find a contiguous subarray whose length is greater than or equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

  

 Example 1:

 Input: nums = [1,12,-5,-6,50,3], k = 4
 Output: 12.75000
 Explanation:
 - When the length is 4, averages are [0.5, 12.75, 10.5] and the maximum average is 12.75
 - When the length is 5, averages are [10.4, 10.8] and the maximum average is 10.8
 - When the length is 6, averages are [9.16667] and the maximum average is 9.16667
 The maximum average is when we choose a subarray of length 4 (i.e., the sub array [12, -5, -6, 50]) which has the max average 12.75, so we return 12.75
 Note that we do not consider the subarrays of length < 4.
 Example 2:

 Input: nums = [5], k = 1
 Output: 5.00000
  

 Constraints:

 n == nums.length
 1 <= k <= n <= 104
 -104 <= nums[i] <= 104
 
 */

import Foundation

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var l = Double(nums.min()!), r = Double(nums.max()!)
        let eps = 1e-5
        
        func valid(_ x: Double) -> Bool {
            if k > nums.count {
                return false
            }
            if k == nums.count {
                return Double(nums.reduce(0, +)) / Double(nums.count) >= x
            }
            var sum: Double = 0
            var prev: Double = 0
            var min_prev: Double = 0
            for i in 0..<k {
                sum += Double(nums[i]) - x
            }
            if sum >= 0 {
                return true
            }
            for i in k..<nums.count {
                let v =
                sum += Double(nums[i]) - x
                prev += Double(nums[i - k]) - x
                min_prev = min(min_prev, prev)
                if sum >= min_prev {
                    return true
                }
            }
            return false
        }
        
        while l + eps < r {
            let mid = (l + r) / 2
            if valid(mid) {
                l = mid
            } else {
                r = mid
            }
        }
        return r
    }
}


//: [Next](@next)
