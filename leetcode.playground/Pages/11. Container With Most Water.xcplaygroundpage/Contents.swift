//: [Previous](@previous)
/*
 11. Container With Most Water
 
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

 Note: You may not slant the container and n is at least 2.

  



 The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

  

 Example:

 Input: [1,8,6,2,5,4,8,3,7]
 Output: 49
 
 */

import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var head = 0
        var tail = height.count - 1
        var result = 0
        while head < tail {
            result = max(result, min(height[head], height[tail])*(tail-head))
            if height[head] < height[tail] {
                head += 1
            } else {
                tail -= 1
            }
        }
        return result
    }
}

let test = Solution()
let result = test.maxArea([3, 2, 9, 5, 9, 3])

//: [Next](@next)
