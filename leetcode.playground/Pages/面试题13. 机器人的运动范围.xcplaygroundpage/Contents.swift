//: [Previous](@previous)

/*
 
 面试题13. 机器人的运动范围
 
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

  

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 1：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20
 
 */
/*
 
 0
 1
 
 */
import Foundation

class Solution {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        
        var matrix: [[Int]] = []
        for i in 0..<m {
            var line: [Int] = []
            for j in 0..<n {
                line.append(i%10+i/10 + j%10+j/10)
            }
            matrix.append(line)
        }
        search(&matrix, 0, 0, k)
        var res: Int = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == -1 {
                    res += 1
                }
            }
        }
        return res
    }
    
    func search(_ matrix: inout [[Int]], _ i: Int, _ j: Int, _ k: Int) {
        let val = matrix[i][j]
        if val == -1 || val > k{
            return
        }
        matrix[i][j] = -1
        if i-1 >= 0 {
            search(&matrix, i-1, j, k)
        }
        if i+1 < matrix.count {
            search(&matrix, i+1, j, k)
        }
        if j-1 >= 0 {
            search(&matrix, i, j-1, k)
        }
        if j+1 < matrix[i].count {
            search(&matrix, i, j+1, k)
        }
        
    }
}

let solution = Solution()
let res = solution.movingCount(1, 2, 1)

//: [Next](@next)
