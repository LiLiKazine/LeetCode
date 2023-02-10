//: [Previous](@previous)

/*
 
 1223. Dice Roll Simulation
 
 A die simulator generates a random number from 1 to 6 for each roll. You introduced a constraint to the generator such that it cannot roll the number i more than rollMax[i] (1-indexed) consecutive times.

 Given an array of integers rollMax and an integer n, return the number of distinct sequences that can be obtained with exact n rolls. Since the answer may be too large, return it modulo 109 + 7.

 Two sequences are considered different if at least one element differs from each other.

  

 Example 1:

 Input: n = 2, rollMax = [1,1,2,2,2,3]
 Output: 34
 Explanation: There will be 2 rolls of die, if there are no constraints on the die, there are 6 * 6 = 36 possible combinations. In this case, looking at rollMax array, the numbers 1 and 2 appear at most once consecutively, therefore sequences (1,1) and (2,2) cannot occur, so the final answer is 36-2 = 34.
 Example 2:

 Input: n = 2, rollMax = [1,1,1,1,1,1]
 Output: 30
 Example 3:

 Input: n = 3, rollMax = [1,1,1,2,2,3]
 Output: 181
  

 Constraints:

 1 <= n <= 5000
 rollMax.length == 6
 1 <= rollMax[i] <= 15
 
 */

class Solution {
    func dieSimulator(_ n: Int, _ rollMax: [Int]) -> Int {
        let mod = 1000000007
        var g = Array(repeating: Array(repeating: Array(repeating: 0, count: 16), count: 6), count: n)
        for i in 0..<6 {
            g[0][i][1] = 1
        }
        for i in 1..<n {
            for j in 0..<6 {
                for k in 1...rollMax[j] {
                    for p in 0..<6 {
                        if p != j {
                            g[i][p][1] = (g[i][p][1] + g[i-1][j][k]) % mod
                        } else if k + 1 <= rollMax[j] {
                            g[i][p][k+1] = (g[i][p][k+1] + g[i-1][j][k]) % mod
                        }
                    }
                }
            }
        }
        
        var ans = 0
        for i in 0..<6 {
            for j in 1...rollMax[i] {
                ans = (ans + g[n-1][i][j]) % mod
            }
        }
        
        return ans
    }
}
//            levs = levs * curLevs.filter { $0 != 0 }.reduce(1, *) % 1000000007

//let n = 2, rollMax = [1,1,2,2,2,3]
//let n = 2, rollMax = [1,1,1,1,1,1]
let n = 3, rollMax = [1,1,1,2,2,3]
let solution = Solution()
let ans = solution.dieSimulator(n, rollMax)
print(ans)

//: [Next](@next)
