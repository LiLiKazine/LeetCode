//: [Previous](@previous)

/*
 
 1631. Path With Minimum Effort
 
 You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.

 A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.

 Return the minimum effort required to travel from the top-left cell to the bottom-right cell.

  

 Example 1:



 Input: heights = [[1,2,2],[3,8,2],[5,3,5]]
 Output: 2
 Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
 This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.
 Example 2:



 Input: heights = [[1,2,3],[3,8,4],[5,3,5]]
 Output: 1
 Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].
 Example 3:


 Input: heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
 Output: 0
 Explanation: This route does not require any effort.
  

 Constraints:

 rows == heights.length
 columns == heights[i].length
 1 <= rows, columns <= 100
 1 <= heights[i][j] <= 106
 
 */

class Solution {
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        guard heights.count > 0 else {
            return 0
        }
        let row = heights.count, column = heights[0].count, dirs: [[Int]] = [[1, 0], [0, 1]]
        var edges: [[Int]] = [], ans = 0
        for i in 0..<row {
            for j in 0..<column {
                let height = heights[i][j]
                for dir in dirs {
                    let x = i + dir[0], y = j + dir[1]
                    if 0 <= x && x < row && 0 <= y && y < column {
                        let effort = abs(heights[x][y] - height)
                        edges.append([i * column + j, x * column + y, effort])
                    }
                }
            }
        }
        edges.sort { $0[2] < $1[2] }
        let union = Union(edges.count + 1)
        for edge in edges {
            let i = edge[0], j = edge[1], effort = edge[2]
            union.unit(i, j, effort)
            if union.find(0) == union.find(row * column - 1) {
                ans = effort
                break
            }
        }
        return ans
    }
    
    private class Union {
        private var union: [Int] = []
        
        init(_ n: Int) {
            for i in 0..<n {
                union.append(i)
            }
        }
        
        func find(_ i: Int) -> Int {
            if union[i] != i {
                union[i] = find(union[i])
            }
            return union[i]
        }
        
        func unit(_ i1: Int, _ i2: Int, _ effor: Int) {
            if find(i1) != find(i2) {
                union[find(i1)] = find(i2)
            }
        }
    }
}

let heights = [[4,3,4,10,5,5,9,2],[10,8,2,10,9,7,5,6],[5,8,10,10,10,7,4,2],[5,1,3,1,1,3,1,9],[6,4,10,6,10,9,4,6]]
let solution = Solution()
let ans = solution.minimumEffortPath(heights)
ans

/*
    let length = heights.count
    var dp: [[Int]] = Array(repeating: Array(repeating: Int.max, count: length), count: length), dirs: [[Int]] = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    for i in 0..<length {
        for j in 0..<length {
            let height = heights[i][j]
            for k in 0..<dirs.count {
                let dir = dirs[k], x = i + dir[0], y = j + dir[1]
                if 0 <= x && x < length && 0 <= y && y < length {
                    dp[i][j] = min(dp[x][y] + height, dp[i][j])
                }
            }
        }
    }
 */
//: [Next](@next)
