//: [Previous](@previous)

/*
 552. Student Attendance Record II
 困难
 An attendance record for a student can be represented as a string where each character signifies whether the student was absent, late, or present on that day. The record only contains the following three characters:

 'A': Absent.
 'L': Late.
 'P': Present.
 Any student is eligible for an attendance award if they meet both of the following criteria:

 The student was absent ('A') for strictly fewer than 2 days total.
 The student was never late ('L') for 3 or more consecutive days.
 Given an integer n, return the number of possible attendance records of length n that make a student eligible for an attendance award. The answer may be very large, so return it modulo 109 + 7.

  

 Example 1:

 Input: n = 2
 Output: 8
 Explanation: There are 8 records with length 2 that are eligible for an award:
 "PP", "AP", "PA", "LP", "PL", "AL", "LA", "LL"
 Only "AA" is not eligible because there are 2 absences (there need to be fewer than 2).
 Example 2:

 Input: n = 1
 Output: 3
 Example 3:

 Input: n = 10101
 Output: 183236316
  

 Constraints:

 1 <= n <= 105
 */

import Foundation

class Solution {
    
    let modulo = 1000000000 + 7
    
    var cache: [[[Int]]] = []
    
    func checkRecord(_ n: Int) -> Int {
        cache = Array(repeating: Array(repeating: Array(repeating: -1, count: 3), count: 2), count: n + 1)
        return build(with: 0, absent: 0, late: 0, n: n)
    }
    
    func build(with cnt: Int, absent: Int, late: Int, n: Int) -> Int {
        if cnt == n { return 1 }
        let value = cache[cnt][absent][late]
        if value >= 0 {
            return value
        }
        var ans = 0
        if absent == 0 {
            ans += build(with: cnt + 1, absent: 1, late: 0, n: n)
        }
        if late < 2 {
            ans += build(with: cnt + 1, absent: absent, late: late + 1, n: n)
        }
        ans += build(with: cnt + 1, absent: absent, late: 0, n: n)
        
        ans = ans % modulo
        cache[cnt][absent][late] = ans
        return ans
    }
}

//: [Next](@next)
