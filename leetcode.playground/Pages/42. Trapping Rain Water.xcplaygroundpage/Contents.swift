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
        return dynamic(height)
    }
    
    func brute(_ height: [Int]) -> Int {
        var ans = 0
        let size = height.count
        if size == 0 {
            return 0
        }
        for i in 0..<size-1 {
            var maxLeft = 0, maxRight = 0, j = i, k = i
            while j >= 0 {
                maxLeft = max(maxLeft, height[j])
                j-=1
            }
            while k < size {
                maxRight = max(maxRight, height[k])
                k+=1
            }
            ans += min(maxLeft, maxRight) - height[i]
        }
        return ans
    }
    
    func dynamic(_ height: [Int]) -> Int {
        let size = height.count
        if size == 0 {
            return 0
        }
        var ans = 0, maxLeft = Array(repeating: -1, count: size),
        maxRight = Array(repeating: -1, count: size),
        j = size-1
        maxLeft[0] = height[0]
        maxRight[size-1] = height[size-1]
        for i in 1..<size {
            maxLeft[i] = max(maxLeft[i-1], height[i])
        }
        
        while j > 0 {
            maxRight[j-1] = max(maxRight[j], height[j-1])
            j-=1
        }
        for i in 0..<size {
            ans += min(maxLeft[i], maxRight[i]) - height[i]
        }
        return ans
    }
}
let test = Solution()
let result = test.dynamic([0,1,0,2,1,0,1,3,2,1,2,1])
//: [Next](@next)
