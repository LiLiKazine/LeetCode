//: [Previous](@previous)

/*
 78. Subsets
 Medium

 Given a set of distinct integers, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: nums = [1,2,3]
 Output:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 
 */

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        return recursive(nums) + [[]]
    }
    
    func recursive(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var ans: [[Int]] = []
        if let last = nums.popLast() {
            ans.append([last])
            var subs = recursive(nums)
            subs += subs.map { $0 + [last] }
            ans.append(contentsOf: subs)
        }
        return ans
    }
}

let test = Solution()
let result = test.subsets([1,2,3])
//: [Next](@next)
