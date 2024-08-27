//: [Previous](@previous)

/*
 2563. Count the Number of Fair Pairs
 中等
 Given a 0-indexed integer array nums of size n and two integers lower and upper, return the number of fair pairs.

 A pair (i, j) is fair if:

 0 <= i < j < n, and
 lower <= nums[i] + nums[j] <= upper
  

 Example 1:

 Input: nums = [0,1,7,4,4,5], lower = 3, upper = 6
 Output: 6
 Explanation: There are 6 fair pairs: (0,3), (0,4), (0,5), (1,3), (1,4), and (1,5).
 Example 2:

 Input: nums = [1,7,9,2,5], lower = 11, upper = 11
 Output: 1
 Explanation: There is a single fair pair: (2,3).
  

 Constraints:

 1 <= nums.length <= 105
 nums.length == n
 -109 <= nums[i] <= 109
 -109 <= lower <= upper <= 109
 
 */

import Foundation

class Solution {
    func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        if nums.count <= 1 { return 0 }
        var nums = nums.sorted()
        var ans = 0, l = nums.count, r = nums.count
        for j in 0..<nums.count {
            while r > 0 && nums[r-1] > upper - nums[j] {
                r -= 1
            }
            while l > 0 && nums[l-1] >= lower - nums[j] {
                l -= 1
            }
            ans += min(r, j) - min(l, j)
        }
        return ans
    }
}

//: [Next](@next)
