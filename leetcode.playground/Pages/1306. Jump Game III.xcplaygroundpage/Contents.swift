//: [Previous](@previous)

/*
 1306. Jump Game III
 中等
 Given an array of non-negative integers arr, you are initially positioned at start index of the array. When you are at index i, you can jump to i + arr[i] or i - arr[i], check if you can reach any index with value 0.

 Notice that you can not jump outside of the array at any time.

 Example 1:

 Input: arr = [4,2,3,0,3,1,2], start = 5
 Output: true
 Explanation:
 All possible ways to reach at index 3 with value 0 are:
 index 5 -> index 4 -> index 1 -> index 3
 index 5 -> index 6 -> index 4 -> index 1 -> index 3
 Example 2:

 Input: arr = [4,2,3,0,3,1,2], start = 0
 Output: true
 Explanation:
 One possible way to reach at index 3 with value 0 is:
 index 0 -> index 4 -> index 1 -> index 3
 Example 3:

 Input: arr = [3,0,2,1,2], start = 2
 Output: false
 Explanation: There is no way to reach at index 1 with value 0.
  

 Constraints:

 1 <= arr.length <= 5 * 104
 0 <= arr[i] < arr.length
 0 <= start < arr.length
 
 */

import Foundation

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        if arr[start] == 0 {
            return true
        }

        var visited = Array(repeating: false, count: arr.count)
        visited[start] = true
        var q =  [start]
        
        func isValidPos(_ pos: Int) -> Bool {
            if pos < 0 || pos >= arr.count || visited[pos] {
                return false
            }
            return true
        }
        while q.count > 0 {
            let pos = q.removeFirst()
            let next1 = pos + arr[pos]
            let next2 = pos - arr[pos]
            if isValidPos(next1) {
                if arr[next1] == 0 {
                    return true
                } else {
                    visited[next1] = true
                    q.append(next1)
                }
            }
            if isValidPos(next2) {
                if arr[next2] == 0 {
                    return true
                } else {
                    visited[next2] = true
                    q.append(next2)
                }
            }
        }
        return false
    }
}

//: [Next](@next)
