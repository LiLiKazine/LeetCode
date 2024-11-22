//: [Previous](@previous)

/*
 3233. Find the Count of Numbers Which Are Not Special
 中等
 You are given 2 positive integers l and r. For any number x, all positive divisors of x except x are called the proper divisors of x.

 A number is called special if it has exactly 2 proper divisors. For example:

 The number 4 is special because it has proper divisors 1 and 2.
 The number 6 is not special because it has proper divisors 1, 2, and 3.
 Return the count of numbers in the range [l, r] that are not special.

  

 Example 1:

 Input: l = 5, r = 7

 Output: 3

 Explanation:

 There are no special numbers in the range [5, 7].

 Example 2:

 Input: l = 4, r = 16

 Output: 11

 Explanation:

 The special numbers in the range [4, 16] are 4 and 9.

  

 Constraints:

 1 <= l <= r <= 109
 */

import Foundation

class Solution {
    func nonSpecialCount(_ l: Int, _ r: Int) -> Int {
        // let MX = Int(Double(Int.max).squareRoot().rounded(.down))
        let MX = 31622
        var pi = Array(repeating: 0, count: MX + 1)
        for i in 2...MX {
            if pi[i] == 0 {
                pi[i] = pi[i - 1] + 1
                for j in stride(from: i * i, through: MX, by: i) {
                    pi[j] = -1
                }
            } else {
                pi[i] = pi[i - 1]
            }
        }
        
        let pl = pi[Int(Double(l - 1).squareRoot())], pr = pi[Int(Double(r).squareRoot())]
        let ans = r - l + 1 - (pr - pl)
        return ans
    }
}

//: [Next](@next)
