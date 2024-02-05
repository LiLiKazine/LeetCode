//: [Previous](@previous)

/*
 624. Maximum Distance in Arrays
 
 You are given m arrays, where each array is sorted in ascending order.

 You can pick up two integers from two different arrays (each array picks one) and calculate the distance. We define the distance between two integers a and b to be their absolute difference |a - b|.

 Return the maximum distance.

  

 Example 1:

 Input: arrays = [[1,2,3],[4,5],[1,2,3]]
 Output: 4
 Explanation: One way to reach the maximum distance 4 is to pick 1 in the first or third array and pick 5 in the second array.
 Example 2:

 Input: arrays = [[1],[1]]
 Output: 0
  

 Constraints:

 m == arrays.length
 2 <= m <= 105
 1 <= arrays[i].length <= 500
 -104 <= arrays[i][j] <= 104
 arrays[i] is sorted in ascending order.
 There will be at most 105 integers in all the arrays.
 
 */

import Foundation

class Solution {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var ans = 0
        var lowerest = arrays[0][0], highest = arrays[0].last!
        for i in 1..<arrays.count {
            let low = arrays[i][0], high = arrays[i].last!
            ans = max(ans, abs(high - lowerest), abs(low - highest))
            lowerest = min(lowerest, low)
            highest = max(highest, high)
        }
        return ans
    }
}

//: [Next](@next)
