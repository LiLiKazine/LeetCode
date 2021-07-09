//: [Previous](@previous)

/*
 
 面试题 17.10. Find Majority Element LCCI
 
 A majority element is an element that makes up more than half of the items in an array. Given a positive integers array, find the majority element. If there is no majority element, return -1. Do this in O(N) time and O(1) space.

 Example 1:

 Input: [1,2,5,9,5,9,5,5,5]
 Output: 5
  

 Example 2:

 Input: [3,2]
 Output: -1
  

 Example 3:

 Input: [2,2,1,1,1,2,2]
 Output: 2
 
 */

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = -1, count = 0
        for num in nums {
            if count == 0 {
                candidate = num
            }
            if candidate == num {
                count += 1
            } else {
                count -= 1
            }
        }
        count = 0
        for num in nums {
            if num == candidate {
                count += 1
            }
        }
        
        return count * 2 > nums.count ? candidate : -1
    }
}

let nums = [1,2,5,9,5,9,5,5,5]
let solution = Solution()
let ans = solution.majorityElement(nums)
ans

//: [Next](@next)
