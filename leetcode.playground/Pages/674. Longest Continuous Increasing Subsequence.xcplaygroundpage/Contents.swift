//: [Previous](@previous)

/*
 
 674. Longest Continuous Increasing Subsequence
 
 Given an unsorted array of integers nums, return the length of the longest continuous increasing subsequence (i.e. subarray). The subsequence must be strictly increasing.

 A continuous increasing subsequence is defined by two indices l and r (l < r) such that it is [nums[l], nums[l + 1], ..., nums[r - 1], nums[r]] and for each l <= i < r, nums[i] < nums[i + 1].

  

 Example 1:

 Input: nums = [1,3,5,4,7]
 Output: 3
 Explanation: The longest continuous increasing subsequence is [1,3,5] with length 3.
 Even though [1,3,5,7] is an increasing subsequence, it is not continuous as elements 5 and 7 are separated by element
 4.
 Example 2:

 Input: nums = [2,2,2,2,2]
 Output: 1
 Explanation: The longest continuous increasing subsequence is [2] with length 1. Note that it must be strictly
 increasing.
  

 Constraints:

 0 <= nums.length <= 104
 -109 <= nums[i] <= 109
 
 */

class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var lastNum = nums[0], length = 1, ans = 1
        for i in 1..<nums.count {
            let num = nums[i]
            if num > lastNum {
                length += 1
            } else {
                ans = max(ans, length)
                length = 1
            }
            lastNum = num
        }
        ans = max(ans, length)
        return ans
    }
}

let nums = [1,3,5,4,2,3,4,5]
let solution = Solution()
let ans = solution.findLengthOfLCIS(nums)
ans

//: [Next](@next)
