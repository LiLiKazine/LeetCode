//: [Previous](@previous)

/*
 
 643. Maximum Average Subarray I
 
 Given an array consisting of n integers, find the contiguous subarray of given length k that has the maximum average value. And you need to output the maximum average value.

 Example 1:

 Input: [1,12,-5,-6,50,3], k = 4
 Output: 12.75
 Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75
  

 Note:

 1 <= k <= n <= 30,000.
 Elements of the given array will be in the range [-10,000, 10,000].
 
 */

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var left = 0, right = k, sum: Int = nums[0..<k].reduce(0, +), avg: Double = Double(sum) / Double(k)
        while right < nums.count {
            sum -= nums[left]
            sum += nums[right]
            avg = max(avg, Double(sum) / Double(k))
            left += 1
            right += 1
        }
        return avg
    }
}

//let nums = [-1], k = 1
let nums = [1,12,-5,-6,50,3], k = 4
let solution = Solution()
let ans = solution.findMaxAverage(nums, k)
ans

//: [Next](@next)
