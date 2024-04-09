//: [Previous](@previous)

/*
 15. 3Sum

 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]

 */

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        func twoSum(_ range: Range<Int>, _ target: Int) -> [[Int]] {
            var ans = [[Int]]()
            var lo = range.lowerBound, hi = range.upperBound - 1
            while lo < hi {
                let l = nums[lo], r = nums[hi]
                if l + r == target {
                    ans.append([-target, l, r])
                    repeat {
                        lo += 1
                    } while lo < hi && nums[lo] == nums[lo-1]
                } else if l + r < target {
                    lo += 1
                } else {
                    hi -= 1
                }
            }
            return ans
        }
        
        var ans = [[Int]]()
        
        for i in 0..<nums.count {
            let num = nums[i]
            if num > 0 {
                break
            }
            if i > 0 && num == nums[i-1] {
                continue
            }
            var pairs = twoSum(i+1..<nums.count, -num)
            if pairs.isEmpty { continue }
            ans += pairs
        }
        
        return ans
    }
}

let test = Solution()
let result = test.threeSum([])
//: [Next](@next)
