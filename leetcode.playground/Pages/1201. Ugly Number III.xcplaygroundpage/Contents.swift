//: [Previous](@previous)

/*
 1201. Ugly Number III
 中等
 An ugly number is a positive integer that is divisible by a, b, or c.

 Given four integers n, a, b, and c, return the nth ugly number.

  

 Example 1:

 Input: n = 3, a = 2, b = 3, c = 5
 Output: 4
 Explanation: The ugly numbers are 2, 3, 4, 5, 6, 8, 9, 10... The 3rd is 4.
 Example 2:

 Input: n = 4, a = 2, b = 3, c = 4
 Output: 6
 Explanation: The ugly numbers are 2, 3, 4, 6, 8, 9, 10, 12... The 4th is 6.
 Example 3:

 Input: n = 5, a = 2, b = 11, c = 13
 Output: 10
 Explanation: The ugly numbers are 2, 4, 6, 8, 10, 11, 12, 13... The 5th is 10.
  

 Constraints:

 1 <= n, a, b, c <= 109
 1 <= a * b * c <= 1018
 It is guaranteed that the result will be in range [1, 2 * 109].
 */

import Foundation

class Solution {
    func nthUglyNumber(_ n: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
        var l = 1, r = 2 * 1000000009
        
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        
        func lcm(_ a: Int, _ b: Int) -> Int {
            return a / gcd(a, b) * b
        }
        let lcm1 = lcm(a, b), lcm2 = lcm(a, c), lcm3 = lcm(b, c)
        let lcm4 = lcm(lcm1, c)
        func check(_ x: Int) -> Bool { //至少有n个不大于x的数能被a或b或c整除
            let cnt = x / a + x / b + x / c - x / lcm1 - x / lcm2 - x / lcm3 + x / lcm4
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
        return l
    }
}

//: [Next](@next)
