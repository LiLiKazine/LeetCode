//: [Previous](@previous)

/*
 
 491. Increasing Subsequences
 
 Given an integer array, your task is to find all the different possible increasing subsequences of the given array, and the length of an increasing subsequence should be at least 2.

  

 Example:

 Input: [4, 6, 7, 7]
 Output: [[4, 6], [4, 7], [4, 6, 7], [4, 6, 7, 7], [6, 7], [6, 7, 7], [7,7], [4,7,7]]
  

 Constraints:

 The length of the given array will not exceed 15.
 The range of integer in the given array is [-100,100].
 The given array may contain duplicates, and two equal integers should also be considered as a special case of increasing sequence.
 
 */

class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else {
            return []
        }
        var dp = Array(repeating: Set<[Int]>(), count: nums.count)
        dp[0] = [[nums.first!]]
        for i in 1..<nums.count {
            let num = nums[i]
            for arr in dp[i-1] {
                if arr.last! <= num {
                    dp[i].insert(arr + [num])
                }
                dp[i].insert(arr)
            }
            dp[i].insert([num])
        }
        let ans = dp.last?.filter { $0.count > 1 } ?? []
        return ans
    }
}

let solution = Solution()
let ans = solution.findSubsequences([4, 6, 7, 7])
ans

//: [Next](@next)
