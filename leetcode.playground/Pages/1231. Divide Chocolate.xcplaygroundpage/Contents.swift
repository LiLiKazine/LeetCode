//: [Previous](@previous)

/*
 1231. Divide Chocolate
 困难
 You have one chocolate bar that consists of some chunks. Each chunk has its own sweetness given by the array sweetness.

 You want to share the chocolate with your k friends so you start cutting the chocolate bar into k + 1 pieces using k cuts, each piece consists of some consecutive chunks.

 Being generous, you will eat the piece with the minimum total sweetness and give the other pieces to your friends.

 Find the maximum total sweetness of the piece you can get by cutting the chocolate bar optimally.

  

 Example 1:

 Input: sweetness = [1,2,3,4,5,6,7,8,9], k = 5
 Output: 6
 Explanation: You can divide the chocolate to [1,2,3], [4,5], [6], [7], [8], [9]
 Example 2:

 Input: sweetness = [5,6,7,8,9,1,2,3,4], k = 8
 Output: 1
 Explanation: There is only one way to cut the bar into 9 pieces.
 Example 3:

 Input: sweetness = [1,2,2,1,2,2,1,2,2], k = 2
 Output: 5
 Explanation: You can divide the chocolate to [1,2,2], [1,2,2], [1,2,2]
  

 Constraints:

 0 <= k < sweetness.length <= 104
 1 <= sweetness[i] <= 105
 
 */

import Foundation

class Solution {
    func maximizeSweetness(_ sweetness: [Int], _ k: Int) -> Int {
        var l = 0, r = sweetness.reduce(0, +) + 1
        func check(_ x: Int) -> Bool {
            var cur = 0
            var peopleWithChocolate = 0
            for sweet in sweetness {
                cur += sweet
                if cur >= x {
                    cur = 0
                    peopleWithChocolate += 1
                }
                if peopleWithChocolate > k {
                    return true
                }
            }
            return false
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
