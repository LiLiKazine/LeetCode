//: [Previous](@previous)

/*
 
 415. Add Strings
 
 Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.

 Note:

 The length of both num1 and num2 is < 5100.
 Both num1 and num2 contains only digits 0-9.
 Both num1 and num2 does not contain any leading zero.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 
 */

import Foundation

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        
        let map: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        var num1 = Array(num1), num2 = Array(num2)
        var ans: String = ""
        var carry = 0
        while !num1.isEmpty || !num2.isEmpty {
            let c1 = num1.popLast() ?? "0",
            c2 = num2.popLast() ?? "0"
            let n1 = map.firstIndex(of: c1) ?? 0,
            n2 = map.firstIndex(of: c2) ?? 0
            let sum = n1 + n2 + carry
            carry = sum / 10
            ans = String(sum%10) + ans
        }
        if carry > 0 {
            ans = String(carry) + ans
        }
        return ans
    }
}

let solution = Solution()
let ans = solution.addStrings("99", "9")
ans

//: [Next](@next)
