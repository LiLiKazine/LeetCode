//: [Previous](@previous)

/*
 40. Combination Sum II
 
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 Each number in candidates may only be used once in the combination.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8,
 A solution set is:
 [
   [1, 7],
   [1, 2, 5],
   [2, 6],
   [1, 1, 6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5,
 A solution set is:
 [
   [1,2,2],
   [5]
 ]
 
 */

import Foundation

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        let result = backTracing([], candidates, target)
        return result
    }
    
    func backTracing(_ heads: [Int], _ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        for i in 0..<candidates.count {
            if i-1>=0 && candidates[i] == candidates[i-1] {
                continue
            }
            let val = candidates[i]
            let diff = target - val
            if diff == 0 {
                result.append(heads + [val])
                break
            }
            if diff < 0 {
                break
            }
            if i + 1 == candidates.count {
                break
            }
            let tails = backTracing(heads+[val], Array(candidates[i+1..<candidates.count]), diff)
            result.append(contentsOf: tails)
        }
        return result
    }
}

//: [Next](@next)
