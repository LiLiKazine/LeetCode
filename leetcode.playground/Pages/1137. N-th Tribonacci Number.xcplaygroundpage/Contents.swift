//: [Previous](@previous)

/*
 
 1137. N-th Tribonacci Number
 
 The Tribonacci sequence Tn is defined as follows:

 T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.

 Given n, return the value of Tn.

  

 Example 1:

 Input: n = 4
 Output: 4
 Explanation:
 T_3 = 0 + 1 + 1 = 2
 T_4 = 1 + 1 + 2 = 4
 Example 2:

 Input: n = 25
 Output: 1389537
  

 Constraints:

 0 <= n <= 37
 The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.
 
 */

class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 || n == 2 {
            return 1
        }
        var t0 = 0, t1 = 1, t2 = 1
        for _ in 3...n {
            let tn = t0 + t1 + t2
            t0 = t1
            t1 = t2
            t2 = tn
        }
        return t2
    }
}

let n = 25
let solution = Solution()
let ans = solution.tribonacci(n)
ans

//: [Next](@next)
