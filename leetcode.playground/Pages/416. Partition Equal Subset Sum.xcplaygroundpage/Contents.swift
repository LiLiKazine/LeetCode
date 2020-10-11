//: [Previous](@previous)

/*
 
 416. Partition Equal Subset Sum
 
 Given a non-empty array nums containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

  

 Example 1:

 Input: nums = [1,5,11,5]
 Output: true
 Explanation: The array can be partitioned as [1, 5, 5] and [11].
 Example 2:

 Input: nums = [1,2,3,5]
 Output: false
 Explanation: The array cannot be partitioned into equal sum subsets.
  

 Constraints:

 1 <= nums.length <= 200
 1 <= nums[i] <= 100
 
 */

class Solution {
        
    func canPartition(_ nums: [Int]) -> Bool {
//        let sorted = nums.sorted(), sum = nums.reduce(0, +)
//        if sum % 2 == 1 {
//            return false
//        }
//
//
//        return reach(sum / 2, 0, 0, sorted)
        return dp(nums)
    }
    
    func dp(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return false
        }
        var sum = 0, maxNum = 0
        for num in nums {
            sum += num
            maxNum = max(num, maxNum)
        }
        let target = sum / 2
        if maxNum > target || sum % 2 == 1 {
            return false
        }
        var cache: Array<Array<Bool>> = Array(repeating: Array(repeating: false, count: target + 1), count: nums.count)
        cache[0][nums[0]] = true
        for i in 1..<nums.count {
            let num = nums[i]
            for j in 1...target {
                if j > num {
                    cache[i][j] = cache[i-1][j] || cache[i-1][j-num]
                } else {
                    cache[i][j] = cache[i-1][j]
                }
            }
        }
        return cache[nums.count-1][target]
    }
    
    func reach(_ target: Int, _ current: Int, _ i: Int, _ nums: [Int]) -> Bool {
        if target == current {
            return true
        } else if target < current || i >= nums.count {
            return false
        } else {
            return reach(target, current + nums[i], i + 1, nums) ||
            reach(target, current, i + 1, nums)
            
        }
    }
}

let input = [1,5,11,5]
let solution = Solution()
let ans = solution.canPartition(input)
ans

//: [Next](@next)
