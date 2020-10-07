//: [Previous](@previous)

/*
 
 75. Sort Colors
 
 Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

 Follow up:

 Could you solve this problem without using the library's sort function?
 Could you come up with a one-pass algorithm using only O(1) constant space?
  

 Example 1:

 Input: nums = [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Example 2:

 Input: nums = [2,0,1]
 Output: [0,1,2]
 Example 3:

 Input: nums = [0]
 Output: [0]
 Example 4:

 Input: nums = [1]
 Output: [1]
  

 Constraints:

 n == nums.length
 1 <= n <= 300
 nums[i] is 0, 1, or 2.
 
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var i = 0
        while i < nums.count {
            if nums[i] == 0 {
                let temp = nums.remove(at: i)
                nums.insert(temp, at: 0)
                i += 1
            } else if nums[i] == 2 {
                let temp = nums.remove(at: i)
                nums.append(temp)
                var j = i
                while j < nums.count && nums[j] == 2 {
                    j += 1
                }
                if j == nums.count {
                    i = j
                }
            } else {
                i += 1
            }
        }
    }
}


var input = [2,2,1]
let solution = Solution()

solution.sortColors(&input)

input
//: [Next](@next)
