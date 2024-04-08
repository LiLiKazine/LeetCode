//: [Previous](@previous)

/*
 42. Trapping Rain Water
 
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.


 The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

 Example:

 Input: [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 
 */

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var left = Array(repeating: 0, count: height.count)
        for i in 1..<height.count {
            left[i] = max(height[i-1], left[i-1])
        }
        var right = height.last!, ans = 0
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            let lev = height[i]
            ans += max(0, min(right, left[i]) - lev)
            right = max(right, height[i])
        }
        return ans
    }
}

//: [Next](@next)
