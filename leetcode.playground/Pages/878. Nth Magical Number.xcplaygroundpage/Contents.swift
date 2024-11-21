//: [Previous](@previous)

/*
 878. Nth Magical Number
 困难
 A positive integer is magical if it is divisible by either a or b.

 Given the three integers n, a, and b, return the nth magical number. Since the answer may be very large, return it modulo 109 + 7.

  

 Example 1:

 Input: n = 1, a = 2, b = 3
 Output: 2
 Example 2:

 Input: n = 4, a = 2, b = 3
 Output: 6
  

 Constraints:

 1 <= n <= 109
 2 <= a, b <= 4 * 104
 */

import Foundation

class Solution {
    func nthMagicalNumber(_ n: Int, _ a: Int, _ b: Int) -> Int {
        let modulo = 1000000007
        var l = 1, r = Int.max
        
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        
        let lcm = a / gcd(a, b) * b
        
        func check(_ x: Int) -> Bool { //至少有n个数能被a或b整除且不大于x
            let cnt = x / a + x / b - x / lcm
            return cnt >= n
        }
        
        while l <= r {
            let mid = l + (r - l) / 2
            if check(mid) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l % modulo
    }
}

//: [Next](@next)
