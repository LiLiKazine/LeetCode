//: [Previous](@previous)
/*
 39. Combination Sum
 
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 The same repeated number may be chosen from candidates unlimited number of times.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
   [7],
   [2,2,3]
 ]
 Example 2:

 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
 
 */

import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        for i in 0..<candidates.count {
            let remain = target - candidates[i]
            if remain == 0 {
                return [[candidates[i]]]
                
            } else if remain > 0 {
                return combinationSum(Array(candidates[i..<candidates.count]), remain)
                    .map { arr -> [Int] in
                        var copy = arr
                        copy.insert(candidates[i], at: 0)
                        return copy
                }
            } else {
                return []
            }
        }
        return []
    }
}

let test = Solution()
let result = test.combinationSum([2,3,6,7], 7)

//: [Next](@next)
