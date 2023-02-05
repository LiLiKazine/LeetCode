//: [Previous](@previous)

/*
 
 1210. Minimum Moves to Reach Target with Rotations
 In an n*n grid, there is a snake that spans 2 cells and starts moving from the top left corner at (0, 0) and (0, 1). The grid has empty cells represented by zeros and blocked cells represented by ones. The snake wants to reach the lower right corner at (n-1, n-2) and (n-1, n-1).

 In one move the snake can:

 Move one cell to the right if there are no blocked cells there. This move keeps the horizontal/vertical position of the snake as it is.
 Move down one cell if there are no blocked cells there. This move keeps the horizontal/vertical position of the snake as it is.
 Rotate clockwise if it's in a horizontal position and the two cells under it are both empty. In that case the snake moves from (r, c) and (r, c+1) to (r, c) and (r+1, c).

 Rotate counterclockwise if it's in a vertical position and the two cells to its right are both empty. In that case the snake moves from (r, c) and (r+1, c) to (r, c) and (r, c+1).

 Return the minimum number of moves to reach the target.

 If there is no way to reach the target, return -1.

 Example 1:

 Input: grid = [[0,0,0,0,0,1],
                [1,1,0,0,1,0],
                [0,0,0,0,1,1],
                [0,0,1,0,1,0],
                [0,1,1,0,0,0],
                [0,1,1,0,0,0]]
 Output: 11
 Explanation:
 One possible solution is [right, right, rotate clockwise, right, down, down, down, down, rotate counterclockwise, right, down].
 Example 2:

 Input: grid = [[0,0,1,1,1,1],
                [0,0,0,0,1,1],
                [1,1,0,0,0,1],
                [1,1,1,0,0,1],
                [1,1,1,0,0,1],
                [1,1,1,0,0,0]]
 Output: 9
  

 Constraints:

 2 <= n <= 100
 0 <= grid[i][j] <= 1
 It is guaranteed that the snake starts at empty cells.
 
 */


class Solution {
    
    typealias Snake = (Int, Int, Int)
    
    func minimumMoves(_ grid: [[Int]]) -> Int {
        let row = grid.count, column = grid[0].count
        var visit = Array(0..<row)
            .map { _ in
                Array(0..<column)
                    .map { _ in [-1, -1] }
            }
        visit[0][1][0] = 0
        var q = [Snake(0, 1, 0)]
        
        while !q.isEmpty {
            
            let (x, y, status) = q.removeFirst()
            if status == 0 {
                if y + 1 < row && grid[x][y+1] == 0 {
                    if visit[x][y+1][status] < 0 {
                        visit[x][y+1][status] = visit[x][y][status] + 1
                        q.append((x, y+1, status))
                    }
                }
                if x + 1 < row && grid[x+1][y] == 0 && grid[x+1][y-1] == 0 {
                    if visit[x+1][y][status] < 0 {
                        visit[x+1][y][status] = visit[x][y][status] + 1
                        q.append((x+1, y, status))
                    }
                    if visit[x+1][y-1][1-status] < 0 {
                        visit[x+1][y-1][1-status] = visit[x][y][status] + 1
                        q.append((x+1, y-1, 1-status))
                    }
                }
            }
            if status == 1 {
                if x + 1 < column && grid[x+1][y] == 0 {
                    if visit[x+1][y][status] < 0 {
                        visit[x+1][y][status] = visit[x][y][status] + 1
                        q.append((x+1, y, status))
                    }
                }
                if y + 1 < column && grid[x][y+1] == 0 && grid[x-1][y+1] == 0 {
                    if visit[x][y+1][status] < 0 {
                        visit[x][y+1][status] = visit[x][y][status] + 1
                        q.append((x, y+1, status))
                    }
                    if visit[x-1][y+1][1-status] < 0 {
                        visit[x-1][y+1][1-status] = visit[x][y][status] + 1
                        q.append((x-1, y+1, 1-status))
                    }
                }
            }
        }
        guard let last = visit.last?.last else {
            return -1
        }
        return last[0]
    }
}

//let grid = [[0,0,1,1,1,1],
//            [0,0,0,0,1,1],
//            [1,1,0,0,0,1],
//            [1,1,1,0,0,1],
//            [1,1,1,0,0,1],
//            [1,1,1,0,0,0]]
let grid = [[0,0,0,0,0,1],
            [1,1,0,0,1,0],
            [0,0,0,0,1,1],
            [0,0,1,0,1,0],
            [0,1,1,0,0,0],
            [0,1,1,0,0,0]]
let solution = Solution()
let ans = solution.minimumMoves(grid)
print(ans)


//: [Next](@next)
