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

/*
 
 class Solution {
 public:
     bool judgeSquareSum(int c) {
         for (long a = 0; a * a <= c; a++) {
             double b = sqrt(c - a * a);
             if (b == (int)b) {
                 return true;
             }
         }
         return false;
     }
 };
 
 */


class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var a = 0
        while a * a <= c {
            let b = Int(Float(c - a * a).squareRoot())
            if c == a * a + b * b {
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
