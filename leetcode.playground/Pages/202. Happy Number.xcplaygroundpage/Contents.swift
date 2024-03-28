//: [Previous](@previous)

/*
 
 202. Happy Number
 
 Write an algorithm to determine if a number n is "happy".

 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

 Return True if n is a happy number, and False if not.

 Example:

 Input: 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 
 */

import Foundation

class Solution {

    func isHappy(_ n: Int) -> Bool {
        var slow = n, fast = process(n)
        while fast != 1 && slow != fast {
            slow = process(slow)
            fast = process(process(fast))
        }
        return fast == 1
    }
        
    func process(_ n: Int) -> Int {
        var m = n, res = 0
        while m % 10 + m / 10 > 0 {
            let num = m % 10
            m /= 10
            res += num * num
        }
        return res
    }
}

let solution = Solution()
let ans = solution.isHappy(2)

//: [Next](@next)
