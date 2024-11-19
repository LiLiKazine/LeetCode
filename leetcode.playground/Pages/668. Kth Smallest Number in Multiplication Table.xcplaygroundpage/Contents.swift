//: [Previous](@previous)

/*
 668. Kth Smallest Number in Multiplication Table
 困难
 Nearly everyone has used the Multiplication Table. The multiplication table of size m x n is an integer matrix mat where mat[i][j] == i * j (1-indexed).

 Given three integers m, n, and k, return the kth smallest element in the m x n multiplication table.

  

 Example 1:


 Input: m = 3, n = 3, k = 5
 Output: 3
 Explanation: The 5th smallest number is 3.
 Example 2:


 Input: m = 2, n = 3, k = 6
 Output: 6
 Explanation: The 6th smallest number is 6.
  

 Constraints:

 1 <= m, n <= 3 * 104
 1 <= k <= m * n
 */

import Foundation

class Solution {
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var l = 1, r = m * n
        
        func check(_ x: Int) -> Bool {//至少有k个数不大于x
            var res = 0, r = m, c = 1
            while r > 0 && c <= n {
                if r * c <= x {
                    res += r
                    c += 1
                } else {
                    r -= 1
                }
            }
            return res >= k
        }
        
        while l <= r {
            let mid = l + (r - l) / 2
            if check(mid) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}

//: [Next](@next)
