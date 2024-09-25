//: [Previous](@previous)

/*
 658. Find K Closest Elements
 中等
 Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.

 An integer a is closer to x than an integer b if:

 |a - x| < |b - x|, or
 |a - x| == |b - x| and a < b
  

 Example 1:

 Input: arr = [1,2,3,4,5], k = 4, x = 3

 Output: [1,2,3,4]

 Example 2:

 Input: arr = [1,1,2,3,4,5], k = 4, x = -1

 Output: [1,1,2,3]

  

 Constraints:

 1 <= k <= arr.length
 1 <= arr.length <= 104
 arr is sorted in ascending order.
 -104 <= arr[i], x <= 104
 
 */

import Foundation

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        let len = arr.count
        var l = 0, r = len
        while l < r {
            let mid = l + (r - l) / 2
            if arr[mid] < x {
                l = mid + 1
            } else {
                r = mid
            }
        }
        if l == len {
            return Array(arr[(len-k)...])
        }
        l = arr[l] == x ? l : l - 1
        r = l + 1
        var ans = [Int]()
        while ans.count < k {
            if r < len && l >= 0 {
                if abs(arr[l] - x) <= abs(arr[r] - x) {
                    ans.insert(arr[l], at: 0)
                    l -= 1
                } else {
                    ans.append(arr[r])
                    r += 1
                }
            } else if r == len {
                ans.insert(arr[l], at: 0)
                l -= 1
            } else {
                ans.append(arr[r])
                r += 1
            }
        }
        return ans
    }
}

//: [Next](@next)
