//: [Previous](@previous)

/*
 
 611. Valid Triangle Number
 
 Given an integer array nums, return the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.

  

 Example 1:

 Input: nums = [2,2,3,4]
 Output: 3
 Explanation: Valid combinations are:
 2,3,4 (using the first 2)
 2,3,4 (using the second 2)
 2,2,3
 Example 2:

 Input: nums = [4,2,3,4]
 Output: 4
  

 Constraints:

 1 <= nums.length <= 1000
 0 <= nums[i] <= 1000
 
 */

class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let nums = nums.sorted()
        var ans = 0
        for i in 0..<n {
            for j in i + 1..<n {
                var left = j + 1, right = n - 1, k = j
                while left <= right {
                    let mid = (left + right) / 2
                    if nums[mid] < nums[i] + nums[j] {
                        k = mid
                        left = mid + 1
                    }
                    else {
                        right = mid - 1
                    }
                }
                ans += k - j
            }
        }
        return ans
    }
}

//: [Next](@next)
