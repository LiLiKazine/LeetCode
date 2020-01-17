//: [Previous](@previous)

/*
 46. Permutations
 Medium

 Given a collection of distinct integers, return all possible permutations.

 Example:

 Input: [1,2,3]
 Output:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 */

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count == 1 {
            return [nums]
        }
        var res: [[Int]] = []
        for i in 0..<nums.count {
            var copy = nums
            copy.remove(at: i)
            var arr = permute(copy)
            arr = arr.map { [nums[i]] + $0 }
            res.append(contentsOf: arr)
        }
        return res
    }
}

let test = Solution()
let result = test.permute([1,2,3])

//: [Next](@next)
