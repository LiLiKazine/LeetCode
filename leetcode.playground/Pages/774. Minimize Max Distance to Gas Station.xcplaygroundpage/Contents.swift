//: [Previous](@previous)

/*
 774. Minimize Max Distance to Gas Station
 困难
 You are given an integer array stations that represents the positions of the gas stations on the x-axis. You are also given an integer k.

 You should add k new gas stations. You can add the stations anywhere on the x-axis, and not necessarily on an integer position.

 Let penalty() be the maximum distance between adjacent gas stations after adding the k new stations.

 Return the smallest possible value of penalty(). Answers within 10-6 of the actual answer will be accepted.

  

 Example 1:

 Input: stations = [1,2,3,4,5,6,7,8,9,10], k = 9
 Output: 0.50000
 Example 2:

 Input: stations = [23,24,36,39,46,56,57,65,84,98], k = 1
 Output: 14.00000
  

 Constraints:

 10 <= stations.length <= 2000
 0 <= stations[i] <= 108
 stations is sorted in a strictly increasing order.
 1 <= k <= 106
 */

import Foundation

class Solution {
    func minmaxGasDist(_ stations: [Int], _ k: Int) -> Double {
        let bias = 1e-6
        var l: Double = 0, r = Double(stations.last! - stations.first!)
        
        func check(_ x: Double) -> Bool {
            var n = 0
            for i in 1..<stations.count {
                let d = Double(stations[i] - stations[i-1])
                if d > x {
                    let m = (d / x)
                    n += Int(m)
                    if m.rounded(.down) == m {
                        n -= 1
                    }
                }
            }
            return n <= k
        }
        while l + bias < r {
            let mid = l + (r - l) / 2
            if check(mid) {
                r = mid
            } else {
                l = mid
            }
        }
        return r
    }
}

//: [Next](@next)
