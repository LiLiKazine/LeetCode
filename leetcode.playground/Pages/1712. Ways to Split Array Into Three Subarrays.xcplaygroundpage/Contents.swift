//: [Previous](@previous)

/*
 1712. Ways to Split Array Into Three Subarrays
 中等
 A split of an integer array is good if:

 The array is split into three non-empty contiguous subarrays - named left, mid, right respectively from left to right.
 The sum of the elements in left is less than or equal to the sum of the elements in mid, and the sum of the elements in mid is less than or equal to the sum of the elements in right.
 Given nums, an array of non-negative integers, return the number of good ways to split nums. As the number may be too large, return it modulo 109 + 7.

  

 Example 1:

 Input: nums = [1,1,1]
 Output: 1
 Explanation: The only good way to split nums is [1] [1] [1].
 Example 2:

 Input: nums = [1,2,2,2,5,0]
 Output: 3
 Explanation: There are three good ways of splitting nums:
 [1] [2] [2,2,5,0]
 [1] [2,2] [2,5,0]
 [1,2] [2,2] [5,0]
 Example 3:

 Input: nums = [3,2,1]
 Output: 0
 Explanation: There is no good way to split nums.
  

 Constraints:

 3 <= nums.length <= 105
 0 <= nums[i] <= 104
 
 */

import Foundation

class Solution {
    
    let modulo = 1000000000 + 7
    
    func waysToSplit(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        var ans = 0, prefix = [0]
        for num in nums {
            prefix.append(prefix.last! + num)
        }
        let n = nums.count
        
        var j = 1, k = 1
        for i in 1...n - 2 {
            j = max(i + 1, j)
            while j < n && prefix[j] - prefix[i] < prefix[i] {
                j += 1
            }
            k = max(j, k)
            while k < n && prefix[k] - prefix[i] <= prefix[n] - prefix[k] {
                k += 1
            }
            ans += (k - j)
            ans %= modulo
        }
        return ans
    }
}

//: [Next](@next)
