//: [Previous](@previous)

/*
 
 1139. Largest 1-Bordered Square
 
 Given a 2D grid of 0s and 1s, return the number of elements in the largest square subgrid that has all 1s on its border, or 0 if such a subgrid doesn't exist in the grid.

  

 Example 1:

 Input: grid = [[1,1,1],[1,0,1],[1,1,1]]
 Output: 9
 Example 2:

 Input: grid = [[1,1,0,0]]
 Output: 1
  

 Constraints:

 1 <= grid.length <= 100
 1 <= grid[0].length <= 100
 grid[i][j] is 0 or 1
 
 */

class Solution {
    func largest1BorderedSquare(_ grid: [[Int]]) -> Int {
        let rows = grid.count, columns = grid.first?.count ?? 0
        var vist = Array(repeating: Array(
            repeating: [0, 0],
            count: columns), count: rows)
        vist[0][0] = [grid[0][0], grid[0][0]]
        for i in 1..<rows {
            if grid[i][0] == 0 { continue }
            vist[i][0][0] = vist[i-1][0][0] + 1
            vist[i][0][1] = 1
        }
        for j in 1..<columns {
            if grid[0][j] == 0 { continue }
            vist[0][j][0] = 1
            vist[0][j][1] = vist[0][j-1][1] + 1
        }
        
        for i in 1..<rows {
            for j in 1..<columns {
                if grid[i][j] == 0 {
                    continue
                }
                vist[i][j][0] = vist[i-1][j][0] + 1
                vist[i][j][1] = vist[i][j-1][1] + 1
            }
        }
        
        var ans = 0
        for i in 0..<rows {
            for j in 0..<columns {
                if grid[i][j] == 0 { continue }
                let edge = min(vist[i][j][0], vist[i][j][1])
                if edge < 1 { continue }
                var length = edge
                while length > 0 {
                    if i - length + 1 < 0 || j - length + 1 < 0 {
                        length -= 1
                        continue
                    }
                    if vist[i-length+1][j][1] >= length && vist[i][j-length+1][0] >= length {
                        ans = max(ans, length * length)
                        break
                    }
                    length -= 1
                }
                
            }
        }
        return ans
    }
}

let grid = [[1,1,0,0]]
//let grid = [[1,1,1],[1,0,1],[1,1,1]]
let solution = Solution()
let ans = solution.largest1BorderedSquare(grid)
print(ans)

//: [Next](@next)
