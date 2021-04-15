//: [Previous](@previous)

/*
 
 213. House Robber II
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

  

 Example 1:

 Input: nums = [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
 Example 2:

 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 3:

 Input: nums = [0]
 Output: 0
  

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 1000
 
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.isEmpty ? 0 : nums[0]
        }
        
        var rob1 = Array(repeating:[nums[0], nums[0]], count: nums.count)
        var letgo1 = Array(repeating:[0, 0], count: nums.count)
        
        for i in 1..<nums.count {
            if i == 1 {
                rob1[i] = rob1[i - 1]
                letgo1[i] = [nums[i], 0]
                continue
            } else if i == nums.count - 1 {
                rob1[i] = rob1[i - 1]

            } else {
                rob1[i][0] = max(rob1[i - 1][1] + nums[i], rob1[i - 1][0])
                rob1[i][1] = max(rob1[i - 1][0], rob1[i - 1][1])
            }
            letgo1[i][0] = max(letgo1[i - 1][1] + nums[i], letgo1[i - 1][0])
            letgo1[i][1] = max(letgo1[i - 1][0], letgo1[i - 1][1])
        }
        print(rob1, letgo1)
        return max(max(rob1.last![0], rob1.last![1]), max(letgo1.last![0], letgo1.last![1]))
    }
}

//let nums = [1,2,3,1]
let nums = [2,3,2]
let solution = Solution()
let ans = solution.rob(nums)
ans

//: [Next](@next)
