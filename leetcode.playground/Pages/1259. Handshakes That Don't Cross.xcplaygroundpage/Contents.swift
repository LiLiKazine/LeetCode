//: [Previous](@previous)

/*
 1259. Handshakes That Don't Cross
 困难
 You are given an even number of people numPeople that stand around a circle and each person shakes hands with someone else so that there are numPeople / 2 handshakes total.

 Return the number of ways these handshakes could occur such that none of the handshakes cross.

 Since the answer could be very large, return it modulo 109 + 7.

  

 Example 1:


 Input: numPeople = 4
 Output: 2
 Explanation: There are two ways to do it, the first way is [(1,2),(3,4)] and the second one is [(2,3),(4,1)].
 Example 2:


 Input: numPeople = 6
 Output: 5
  

 Constraints:

 2 <= numPeople <= 1000
 numPeople is even.
 
 */

import Foundation

class Solution {
    
    func numberOfWays(_ numPeople: Int) -> Int {
        if numPeople == 2 {
            return 1
        }
        let modulo = 1000000000 + 7
        
        var dp = Array(repeating: 0, count: numPeople + 1)
        dp[0] = 1
        dp[2] = 1
        for i in 4...numPeople {
            if i % 2 != 0 {
                continue
            }
            for j in 2...i {
                if j % 2 != 0 {
                    continue
                }
                dp[i] = (dp[i] + (dp[j-2] * dp[i-j]) % modulo) % modulo
            }
        }
        return dp[numPeople]
    }
}


//: [Next](@next)
