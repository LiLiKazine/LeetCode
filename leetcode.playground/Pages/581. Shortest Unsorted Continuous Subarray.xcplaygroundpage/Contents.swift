//: [Previous](@previous)

/*
 
 581. Shortest Unsorted Continuous Subarray
 
 Given an integer array nums, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order.

 Return the shortest such subarray and output its length.

  

 Example 1:

 Input: nums = [2,6,4,8,10,9,15]
 Output: 5
 Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
 Example 2:

 Input: nums = [1,2,3,4]
 Output: 0
 Example 3:

 Input: nums = [1]
 Output: 0
  

 Constraints:

 1 <= nums.length <= 104
 -105 <= nums[i] <= 105
  

 Follow up: Can you solve it in O(n) time complexity?
 
 */

class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var maxn = Int.min, right = -1, minn = Int.max, left = -1
        for i in 0..<n {
            if maxn > nums[i] {
                right = i
            } else {
                maxn = nums[i]
            }
            if minn < nums[n - i - 1] {
                left = n - i - 1
            } else {
                minn = nums[n - i - 1]
            }
        }
        return right == -1 ? 0 : right - left + 1
    }
}

//: [Next](@next)
