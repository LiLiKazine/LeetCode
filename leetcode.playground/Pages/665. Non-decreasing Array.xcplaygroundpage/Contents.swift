//: [Previous](@previous)

/*
 
 665. Non-decreasing Array
 
 Given an array nums with n integers, your task is to check if it could become non-decreasing by modifying at most one element.

 We define an array is non-decreasing if nums[i] <= nums[i + 1] holds for every i (0-based) such that (0 <= i <= n - 2).

  

 Example 1:

 Input: nums = [4,2,3]
 Output: true
 Explanation: You could modify the first 4 to 1 to get a non-decreasing array.
 Example 2:

 Input: nums = [4,2,1]
 Output: false
 Explanation: You can't get a non-decreasing array by modify at most one element.
  

 Constraints:

 n == nums.length
 1 <= n <= 104
 -105 <= nums[i] <= 105
 
 */

class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var nums = nums, chance = 1
        guard nums.count > 1 else {
            return true
        }
        for i in 1..<nums.count {
            if nums[i] >= nums[i-1] {
                continue
            }
            if chance == 0 {
                return false
            }
            chance -= 1
            if i == 1 || (nums[i-2] < nums[i-1] && nums[i-2] <= nums[i]) {
                nums[i-1] = nums[i]
            } else if nums[i-2] >= nums[i] {
                nums[i] = nums[i-1]
            } else {
                return false
            }
        }
        return true
    }
}

//let nums = [4,2,3]
let nums = [-1, 4, 2, 3]
let solution = Solution()
let ans = solution.checkPossibility(nums)
ans

//: [Next](@next)
