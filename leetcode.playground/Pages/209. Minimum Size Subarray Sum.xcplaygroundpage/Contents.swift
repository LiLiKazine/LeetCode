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
        guard nums.count > 0 else {
            return 0
        }
        var sum = 0, length = Int.max, i = 0, j = 0

        while j < nums.count {
            if sum < s {
                sum += nums[j]
            } else if i > 0 {
                sum -= nums[i-1]
            }
            if sum < s {
                 j += 1
            } else {
                length = min(j-i+1, length)
                i += 1
            }
        }
        
        return length == Int.max ? 0 : length
    }
}

let solution = Solution()
let ans = solution.minSubArrayLen(11, [1,2,3,4,5])
ans
//: [Next](@next)
