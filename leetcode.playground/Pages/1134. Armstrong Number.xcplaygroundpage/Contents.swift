//: [Previous](@previous)

/*
 1134. Armstrong Number
 简单
 Given an integer n, return true if and only if it is an Armstrong number.

 The k-digit number n is an Armstrong number if and only if the kth power of each digit sums to n.

  

 Example 1:

 Input: n = 153
 Output: true
 Explanation: 153 is a 3-digit number, and 153 = 13 + 53 + 33.
 Example 2:

 Input: n = 123
 Output: false
 Explanation: 123 is a 3-digit number, and 123 != 13 + 23 + 33 = 36.
  

 Constraints:

 1 <= n <= 108
 
 */

import Foundation

class Solution {
    func isArmstrong(_ n: Int) -> Bool {
        let k = String(n).count
        var val = 0, remain = n
        while remain > 0 {
            let digit = remain % 10
            remain = remain / 10
            val += Int(pow(Double(digit), Double(k)))
            if val > n {
                return false
            }
        }
        return val == n
    }
}

//: [Next](@next)
