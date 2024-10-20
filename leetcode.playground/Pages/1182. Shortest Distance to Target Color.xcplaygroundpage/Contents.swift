//: [Previous](@previous)

/*
 1182. Shortest Distance to Target Color
 中等
 You are given an array colors, in which there are three colors: 1, 2 and 3.

 You are also given some queries. Each query consists of two integers i and c, return the shortest distance between the given index i and the target color c. If there is no solution return -1.

  

 Example 1:

 Input: colors = [1,1,2,1,3,2,2,3,3], queries = [[1,3],[2,2],[6,1]]
 Output: [3,0,3]
 Explanation:
 The nearest 3 from index 1 is at index 4 (3 steps away).
 The nearest 2 from index 2 is at index 2 itself (0 steps away).
 The nearest 1 from index 6 is at index 3 (3 steps away).
 Example 2:

 Input: colors = [1,2], queries = [[0,3]]
 Output: [-1]
 Explanation: There is no 3 in the array.
  

 Constraints:

 1 <= colors.length <= 5*10^4
 1 <= colors[i] <= 3
 1 <= queries.length <= 5*10^4
 queries[i].length == 2
 0 <= queries[i][0] < colors.length
 1 <= queries[i][1] <= 3
 */

import Foundation

class Solution {
    func shortestDistanceColor(_ colors: [Int], _ queries: [[Int]]) -> [Int] {
        var pos = Array(repeating: [Int](), count: 4)
        for (i, color) in colors.enumerated() {
            pos[color].append(i)
        }
        
        func distance(of x: Int, c: Int) -> Int {
            let len = pos[c].count
            if len == 0 {
                return -1
            }
            var l = 0, r = len
            while l < r {
                let mid = l + (r - l) / 2
                if pos[c][mid] < x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            var ans = abs(pos[c][min(l, len-1)] - x)
            if l > 0 && l < len {
                ans = min(ans, x - pos[c][l-1])
            }
            return ans
        }
        var ans = [Int]()
        for query in queries {
            let i = query[0], c = query[1]
            let d = distance(of: i, c: c)
            ans.append(d)
        }
        return ans
    }
}

//: [Next](@next)
