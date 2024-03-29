//: [Previous](@previous)

/*
 
 2357. Make Array Zero by Subtracting Equal Amounts
 
 You are given a non-negative integer array nums. In one operation, you must:

 Choose a positive integer x such that x is less than or equal to the smallest non-zero element in nums.
 Subtract x from every positive element in nums.
 Return the minimum number of operations to make every element in nums equal to 0.

  

 Example 1:

 Input: nums = [1,5,0,3,5]
 Output: 3
 Explanation:
 In the first operation, choose x = 1. Now, nums = [0,4,0,2,4].
 In the second operation, choose x = 2. Now, nums = [0,2,0,0,2].
 In the third operation, choose x = 2. Now, nums = [0,0,0,0,0].
 Example 2:

 Input: nums = [0]
 Output: 0
 Explanation: Each element in nums is already 0 so no operations are needed.
  

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 100
 
 */

class Solution {
    
    func minimumOperations(_ nums: [Int]) -> Int {
        var nums = nums
        var sum = nums.reduce(0, +), least = nums.reduce(Int.max) { partialResult, val in
            if val > 0 && val < partialResult {
                return val
            }
            return partialResult
        }
        var ans = 0
        
        while sum != 0 {
            var tmpSum = 0, tempLeast = Int.max
            for i in 0..<nums.count {
                if nums[i] > 0 {
                    nums[i] -= least
                    tmpSum += nums[i]
                }
                if nums[i] > 0 {
                    tempLeast = min(tempLeast, nums[i])
                }
            }
            sum = tmpSum
            least = tempLeast
            ans += 1
        }
        return ans
        
    }
}

let nums = [0]
//let nums = [1,5,0,3,5]
let solution = Solution()
let ans = solution.minimumOperations(nums)

print(ans)

//: [Next](@next)
