//: [Previous](@previous)

/*
 
 633. Sum of Square Numbers
 
 Given a non-negative integer c, decide whether there're two integers a and b such that a^2 + b^2 = c.

 Example 1:

 Input: c = 5
 Output: true
 Explanation: 1 * 1 + 2 * 2 = 5
 Example 2:

 Input: c = 3
 Output: false
 Example 3:

 Input: c = 4
 Output: true
 Example 4:

 Input: c = 2
 Output: true
 Example 5:

 Input: c = 1
 Output: true
  

 Constraints:

 0 <= c <= 231 - 1
 
 */


class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var a = 0
        var set = Set<Int>()
        while a * a <= c {
            set.insert(a * a)
            if set.contains(c - a * a) {
                return true
            }
            a += 1
        }
        return false
    }
}

let c = 999999999
let solution = Solution()
let ans = solution.judgeSquareSum(c)
ans



//: [Next](@next)
