//: [Previous](@previous)

/*
 
 659. Split Array into Consecutive Subsequences
 
 Given an array nums sorted in ascending order, return true if and only if you can split it into 1 or more subsequences such that each subsequence consists of consecutive integers and has length at least 3.

  

 Example 1:

 Input: [1,2,3,3,4,5]
 Output: True
 Explanation:
 You can split them into two consecutive subsequences :
 1, 2, 3
 3, 4, 5
 Example 2:

 Input: [1,2,3,3,4,4,5,5]
 Output: True
 Explanation:
 You can split them into two consecutive subsequences :
 1, 2, 3, 4, 5
 3, 4, 5
 Example 3:

 Input: [1,2,3,4,4,5]
 Output: False
  

 Constraints:

 1 <= nums.length <= 10000
 
 */

class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        let count = nums.count
        guard count >= 3 else {
            return false
        }
        var sum: [Int: Int] = [:],
            cache: [Int: Int] = [:]
        for num in nums {
            sum[num] = (sum[num] ?? 0) + 1
        }
        for num in nums {
            if sum[num]! == 0 {
                continue
            }
            if cache[num-1] != nil && cache[num-1]! > 0 {
                cache[num] = (cache[num] ?? 0) + 1
                cache[num-1]! -= 1
                sum[num]! -= 1
            } else if sum[num+1]
                        != nil && sum[num+1]! > 0 && sum[num+2]
                        != nil && sum[num+2]! > 0 {
                cache[num+2] = (cache[num+2] ?? 0) + 1
                sum[num]! -= 1
                sum[num+1]! -= 1
                sum[num+2]! -= 1
            } else {
                return false
            }
        }
        return true
    }
}

let nums = [1,2,5,5,6,6,7,8,8,9]
let solution = Solution()
let ans = solution.isPossible(nums)

//: [Next](@next)
