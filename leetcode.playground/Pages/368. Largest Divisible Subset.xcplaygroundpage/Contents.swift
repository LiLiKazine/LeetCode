//: [Previous](@previous)

/*
 
 368. Largest Divisible Subset
 
 Given a set of distinct positive integers nums, return the largest subset answer such that every pair (answer[i], answer[j]) of elements in this subset satisfies:

 answer[i] % answer[j] == 0, or
 answer[j] % answer[i] == 0
 If there are multiple solutions, return any of them.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [1,2]
 Explanation: [1,3] is also accepted.
 Example 2:

 Input: nums = [1,2,4,8]
 Output: [1,2,4,8]
  

 Constraints:

 1 <= nums.length <= 1000
 1 <= nums[i] <= 2 * 109
 All the integers in nums are unique.
 
 */

class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        var nums = nums.sorted(), dp: [Int] = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] % nums[j] == 0 {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        var maxLength = 0, end = 0, ans: [Int] = []
        for i in 0..<dp.count {
            if dp[i] >= maxLength {
                maxLength = dp[i]
                end = i
            }
        }
        for i in stride(from: end, to: -1, by: -1) {
            guard maxLength > 0 else {
                break
            }
            if dp[i] == maxLength && (ans.first ?? nums[end])  % nums[i] == 0 {
                ans.insert(nums[i], at: 0)
                maxLength -= 1
            }
        }
        return ans
    }
}

let nums = [4,8,10,240]
//let nums = [3,4,16,8]
//let nums = [1,2,3]
//let nums = [1,2,4,8]
let solution = Solution()
let ans = solution.largestDivisibleSubset(nums)
ans

//: [Next](@next)
