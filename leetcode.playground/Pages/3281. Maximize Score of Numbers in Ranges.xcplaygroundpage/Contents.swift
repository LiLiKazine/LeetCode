//: [Previous](@previous)

/*
 3281. Maximize Score of Numbers in Ranges
 中等
 You are given an array of integers start and an integer d, representing n intervals [start[i], start[i] + d].

 You are asked to choose n integers where the ith integer must belong to the ith interval. The score of the chosen integers is defined as the minimum absolute difference between any two integers that have been chosen.

 Return the maximum possible score of the chosen integers.

  

 Example 1:

 Input: start = [6,0,3], d = 2

 Output: 4

 Explanation:

 The maximum possible score can be obtained by choosing integers: 8, 0, and 4. The score of these chosen integers is min(|8 - 0|, |8 - 4|, |0 - 4|) which equals 4.

 Example 2:

 Input: start = [2,6,13,13], d = 5

 Output: 5

 Explanation:

 The maximum possible score can be obtained by choosing integers: 2, 7, 13, and 18. The score of these chosen integers is min(|2 - 7|, |2 - 13|, |2 - 18|, |7 - 13|, |7 - 18|, |13 - 18|) which equals 5.

  

 Constraints:

 2 <= start.length <= 105
 0 <= start[i] <= 109
 0 <= d <= 109
 */

import Foundation

class Solution {
    func maxPossibleScore(_ start: [Int], _ d: Int) -> Int {
        let start = start.sorted()
        var l = 0, r = start.last! + d - start.first! + 1
        func check(_ x: Int) -> Bool {
            var prev = start[0]
            for i in 1..<start.count {
                if start[i] + d - prev >= x {
                    prev = max(start[i], prev + x)
                } else {
                    return false
                }
            }
            return true
        }
        while l + 1 < r {
            let mid = l + (r - l) / 2
            if check(mid) {
                l = mid
            } else {
                r = mid
            }
        }
        return l
    }
}

//: [Next](@next)
