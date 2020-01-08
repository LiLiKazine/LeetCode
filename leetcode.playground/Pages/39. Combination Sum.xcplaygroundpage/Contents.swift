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
        let result = backTracing([], candidates, target)
        return result
    }
    
    func backTracing(_ heads: [Int], _ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        for i in 0..<candidates.count {
            let diff = target - candidates[i]
            if diff == 0 {
                result.append(heads+[candidates[i]])
                break
            } else if diff > 0 {
                let tails = backTracing(heads+[candidates[i]], Array(candidates[i..<candidates.count]), diff)
                result.append(contentsOf: tails)
            } else {
                break
            }
        }
        return result
    }
}

let test = Solution()
let result = test.combinationSum([2,3,6,7], 7)

//: [Next](@next)
