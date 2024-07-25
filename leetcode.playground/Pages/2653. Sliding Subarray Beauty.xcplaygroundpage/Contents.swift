//: [Previous](@previous)

/*
 2653. Sliding Subarray Beauty
 中等
 Given an integer array nums containing n integers, find the beauty of each subarray of size k.

 The beauty of a subarray is the xth smallest integer in the subarray if it is negative, or 0 if there are fewer than x negative integers.

 Return an integer array containing n - k + 1 integers, which denote the beauty of the subarrays in order from the first index in the array.

 A subarray is a contiguous non-empty sequence of elements within an array.

  

 Example 1:

 Input: nums = [1,-1,-3,-2,3], k = 3, x = 2
 Output: [-1,-2,-2]
 Explanation: There are 3 subarrays with size k = 3.
 The first subarray is [1, -1, -3] and the 2nd smallest negative integer is -1.
 The second subarray is [-1, -3, -2] and the 2nd smallest negative integer is -2.
 The third subarray is [-3, -2, 3] and the 2nd smallest negative integer is -2.
 Example 2:

 Input: nums = [-1,-2,-3,-4,-5], k = 2, x = 2
 Output: [-1,-2,-3,-4]
 Explanation: There are 4 subarrays with size k = 2.
 For [-1, -2], the 2nd smallest negative integer is -1.
 For [-2, -3], the 2nd smallest negative integer is -2.
 For [-3, -4], the 2nd smallest negative integer is -3.
 For [-4, -5], the 2nd smallest negative integer is -4.
 Example 3:

 Input: nums = [-3,1,2,-3,0,-3], k = 2, x = 1
 Output: [-3,0,-3,-3,-3]
 Explanation: There are 5 subarrays with size k = 2.
 For [-3, 1], the 1st smallest negative integer is -3.
 For [1, 2], there is no negative integer so the beauty is 0.
 For [2, -3], the 1st smallest negative integer is -3.
 For [-3, 0], the 1st smallest negative integer is -3.
 For [0, -3], the 1st smallest negative integer is -3.
  

 Constraints:

 n == nums.length
 1 <= n <= 105
 1 <= k <= n
 1 <= x <= k
 -50 <= nums[i] <= 50
 */

import Foundation

class Solution {
    func getSubarrayBeauty(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
        let n = nums.count, bias = 50
        var ans = Array(repeating: 0, count: n - k + 1)
        var cnt = Array(repeating: 0, count: bias * 2 + 1)
        for (i, num) in nums.enumerated() {
            cnt[num + bias] += 1
            if i >= k - 1 {
                var x = x
                for j in 0..<bias {
                    x -= cnt[j]
                    if x <= 0 {
                        ans[i - k + 1] = j - bias
                        break
                    }
                }
                cnt[nums[i - k + 1] + bias] -= 1
            }
        }
        return ans
    }
}

//: [Next](@next)
