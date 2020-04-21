//: [Previous](@previous)

/*
 
 442. Find All Duplicates in an Array
 
 Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements that appear twice in this array.

 Could you do it without extra space and in O(n) runtime?

 Example:
 Input:
 [4,3,2,7,8,2,3,1]

 Output:
 [2,3]
 
 */

import Foundation

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
//        return sort(nums)
        var copy = nums
        return negtive(&copy)
    }
    
    func negtive(_ nums: inout [Int]) -> [Int] {
        var ans: [Int] = []
        for i in 0..<nums.count {
            let val = nums[i]
            if nums[abs(val)-1] < 0 {
                ans.append(abs(val))
            } else {
                nums[abs(val)-1] = -nums[abs(val)-1]
            }
        }
        return ans
    }
    
    func sort(_ nums: [Int]) -> [Int] {
        var nums = nums, count = nums.count, i = 0, ans: [Int] = []
        while i < count {
            let val = nums[i]
            if i + 1 != val {
                let temp = nums[val-1]
                if temp == val {
                    i += 1
                } else {
                    nums[val-1] = val
                    nums[i] = temp
                }
            } else {
                i += 1
            }
        }
        for (i, v) in nums.enumerated() {
            if i+1 != v {
                ans.append(v)
            }
        }
        return ans
    }
}

//: [Next](@next)
