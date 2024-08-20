//: [Previous](@previous)

/*
 713. Subarray Product Less Than K
 中等
 Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.

  

 Example 1:

 Input: nums = [10,5,2,6], k = 100
 Output: 8
 Explanation: The 8 subarrays that have product less than 100 are:
 [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
 Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
 Example 2:

 Input: nums = [1,2,3], k = 0
 Output: 0
  

 Constraints:

 1 <= nums.length <= 3 * 104
 1 <= nums[i] <= 1000
 0 <= k <= 106
 
 */

import Foundation

/*
 ans += r - l +1;是怎么得来的？

 对于有n个元素的集合：

 包含 1 个元素的子集有 n 个
 包含 2 个连续元素的子集有 n - 1 个
 ...
 包含 n 个连续元素的子集有 1 个
 总共有 1 + 2 + 3 +... + n = （n+1）*n/2个连续元素的子集
 那么对于n-1个元素的集合：共有(n) * (n-1)/2个连续元素的子集。

 (n+1)n/2 - n(n-1)/2 = n/2 * (2)=n 对于n-1个元素的集合，增加第n个元素，则增加的连续元素子集数为n个。

 对于a[l] ... a[r - 1] 的集合，增加第r个元素a[r]，则增加的连续元素子集数为 a[l] ... a[r] 范围内的元素总数即 r - l +1个。
 */

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k <= 1 { return 0 }
        var ans = 0
        var product = 1
        var lo = 0
        for hi in 0..<nums.count {
            let num = nums[hi]
            product *= num
            while product >= k {
                product /= nums[lo]
                lo += 1
            }
            ans += (hi - lo + 1)
        }
        return ans
    }
}

//: [Next](@next)
