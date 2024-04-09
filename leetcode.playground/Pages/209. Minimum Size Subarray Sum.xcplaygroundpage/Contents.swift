//: [Previous](@previous)

/*
 
209. Minimum Size Subarray Sum

Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

Example:

Input: s = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: the subarray [4,3] has the minimal length under the problem constraint.
Follow up:
If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
 
*/
 
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        
        if nums.isEmpty { return 0 }
        
        var cnt = 0, len = Int.max, lo = 0
        for hi in 0..<nums.count {
            cnt += nums[hi]
            while cnt >= s, lo <= hi {
                len = min(hi - lo + 1, len)
                cnt -= nums[lo]
                lo += 1
            }
        }
        return len > nums.count ? 0 : len
    }
}

let solution = Solution()
let ans = solution.minSubArrayLen(11, [1,2,3,4,5])
ans
//: [Next](@next)
