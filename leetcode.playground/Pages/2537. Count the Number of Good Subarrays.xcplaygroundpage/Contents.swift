//: [Previous](@previous)

/*
 2537. Count the Number of Good Subarrays
 中等
 Given an integer array nums and an integer k, return the number of good subarrays of nums.

 A subarray arr is good if it there are at least k pairs of indices (i, j) such that i < j and arr[i] == arr[j].

 A subarray is a contiguous non-empty sequence of elements within an array.

  

 Example 1:

 Input: nums = [1,1,1,1,1], k = 10
 Output: 1
 Explanation: The only good subarray is the array nums itself.
 Example 2:

 Input: nums = [3,1,4,3,2,2,4], k = 2
 Output: 4
 Explanation: There are 4 different good subarrays:
 - [3,1,4,3,2,2] that has 2 pairs.
 - [3,1,4,3,2,2,4] that has 3 pairs.
 - [1,4,3,2,2,4] that has 2 pairs.
 - [4,3,2,2,4] that has 2 pairs.
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i], k <= 109
 
 */

import Foundation

class Solution {
    func countGood(_ nums: [Int], _ k: Int) -> Int {

        var dict = [Int: Int]()
        var l = 0, ans = 0, cnt = 0
        
        for r in 0..<nums.count {
            let num = nums[r]
            dict[num] = dict[num, default: 0] + 1
            if let value = dict[num], value > 1 {
                cnt += (sum(of: value - 1) - sum(of: value - 2))
            }
            while cnt >= k {
                ans += (nums.count - r)
                let num = nums[l]
                if let value = dict[num] {
                    dict[num] = value - 1
                    cnt -= (sum(of: value - 1) - sum(of: value - 2))
                }
                l += 1
            }
        }
        return ans
    }
    
    func sum(of value: Int) -> Int {
        guard value > 0 else { return 0 }
        return ((value + 1) * value) / 2
    }
}

//: [Next](@next)
