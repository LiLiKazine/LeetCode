//: [Previous](@previous)

/*
 
 1269. Number of Ways to Stay in the Same Place After Some Steps
 
 You have a pointer at index 0 in an array of size arrLen. At each step, you can move 1 position to the left, 1 position to the right in the array or stay in the same place  (The pointer should not be placed outside the array at any time).

 Given two integers steps and arrLen, return the number of ways such that your pointer still at index 0 after exactly steps steps.

 Since the answer may be too large, return it modulo 10^9 + 7.

  

 Example 1:

 Input: steps = 3, arrLen = 2
 Output: 4
 Explanation: There are 4 differents ways to stay at index 0 after 3 steps.
 Right, Left, Stay
 Stay, Right, Left
 Right, Stay, Left
 Stay, Stay, Stay
 Example 2:

 Input: steps = 2, arrLen = 4
 Output: 2
 Explanation: There are 2 differents ways to stay at index 0 after 2 steps
 Right, Left
 Stay, Stay
 Example 3:

 Input: steps = 4, arrLen = 2
 Output: 8
  

 Constraints:

 1 <= steps <= 500
 1 <= arrLen <= 10^6
 
 */

class Solution {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        return simpleDP(steps, arrLen)
    }
    
    private func simpleDP(_ steps: Int, _ arrLen: Int) -> Int {
        let MODULO = 1000000007
        let maxIndex = min(steps / 2, arrLen - 1)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: maxIndex + 1), count: steps + 1)
        dp[steps][0] = 1
        for i in stride(from: steps - 1, to: -1, by: -1) {
            let edge = min(maxIndex, i)
            for j in 0...edge {
                dp[i][j] = (dp[i][j] + dp[i + 1][j]) % MODULO
                if j - 1 >= 0  {
                    dp[i][j] = (dp[i][j] + dp[i + 1][j - 1]) % MODULO
                }
                if j + 1 <= maxIndex {
                    dp[i][j] = (dp[i][j] + dp[i + 1][j + 1]) % MODULO
                }
            }
        }
        return dp[0][0]
    }
}

let steps = 27, arrLen = 7
let solution = Solution()
let ans = solution.numWays(steps, arrLen)
ans

//: [Next](@next)
