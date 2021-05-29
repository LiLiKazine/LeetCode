//: [Previous](@previous)

/*
 
 1074. Number of Submatrices That Sum to Target
 
 Given a matrix and a target, return the number of non-empty submatrices that sum to target.

 A submatrix x1, y1, x2, y2 is the set of all cells matrix[x][y] with x1 <= x <= x2 and y1 <= y <= y2.

 Two submatrices (x1, y1, x2, y2) and (x1', y1', x2', y2') are different if they have some coordinate that is different: for example, if x1 != x1'.

  

 Example 1:


 Input: matrix = [[0,1,0],[1,1,1],[0,1,0]], target = 0
 Output: 4
 Explanation: The four 1x1 submatrices that only contain 0.
 Example 2:

 Input: matrix = [[1,-1],[-1,1]], target = 0
 Output: 5
 Explanation: The two 1x2 submatrices, plus the two 2x1 submatrices, plus the 2x2 submatrix.
 Example 3:

 Input: matrix = [[904]], target = 0
 Output: 0
  

 Constraints:

 1 <= matrix.length <= 100
 1 <= matrix[0].length <= 100
 -1000 <= matrix[i] <= 1000
 -10^8 <= target <= 10^8
 
 */

class Solution {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        var ans = 0
        let m = matrix.count, n = matrix.first?.count ?? 0
        for i in 0..<m {
            var sums: [Int] = Array(repeating: 0, count: n)
            for j in i..<m {
                for k in 0..<n {
                    sums[k] += matrix[j][k]
                }
                var sum: Int = 0, map: [Int: Int] = [0: 1]
                for v in 0..<sums.count {
                    sum += sums[v]
                    ans += map[sum - target] ?? 0
                    map[sum] = (map[sum] ?? 0) + 1
                }
            }
        }
        return ans
        
    }
    
    
    private func exceeded(_ matrix: [[Int]], _ target: Int) -> Int {
        let m = matrix.count, n = matrix.first?.count ?? 0
        var ans = 0, dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 0..<m {
            for j in 0..<n {
                dp[i + 1][j + 1] = dp[i][j + 1] + dp[i + 1][j] - dp[i][j] + matrix[i][j]
                for k in 0...i {
                    for v in 0...j {
                        if dp[i + 1][j + 1] + dp[k][v] - dp[k][j + 1] - dp[i + 1][v] == target {
                            ans += 1
                        }
                    }
                }
            }
        }
        return ans
    }
}

let matrix = [[1,-1],[-1,1]], target = 0
let solution = Solution()
let ans = solution.numSubmatrixSumTarget(matrix, target)
ans

/*
 
 [[1,-1],
  [-1,1]]
 
 [[0, 0, 0],
  [0, 1, 0],
  [0, 0, 0]]

 
 */
//: [Next](@next)
