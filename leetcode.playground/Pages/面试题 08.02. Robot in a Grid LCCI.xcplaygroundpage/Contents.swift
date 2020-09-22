//: [Previous](@previous)

/*
 
 面试题 08.02. Robot in a Grid LCCI
 
 Imagine a robot sitting on the upper left corner of grid with r rows and c columns. The robot can only move in two directions, right and down, but certain cells are "off limits" such that the robot cannot step on them. Design an algorithm to find a path for the robot from the top left to the bottom right.



 "off limits" and empty grid are represented by 1 and 0 respectively.

 Return a valid path, consisting of row number and column number of grids in the path.

 Example 1:

 Input:
 [
   [0,0,0],
   [0,1,0],
   [0,0,0]
 ]
 Output: [[0,0],[0,1],[0,2],[1,2],[2,2]]
 Note:

 r, c <= 100
 
 */

/*
 
 class Solution {

     List<List<Integer>> path = new LinkedList<>();  // 记录路径
     int r = 0;  // 行数
     int c = 0;  // 列数
     public List<List<Integer>> pathWithObstacles(int[][] obstacleGrid) {
         r = obstacleGrid.length;
         if (r == 0) {       // 空网格
             return path;
         }
         c = obstacleGrid[0].length;
         if (obstacleGrid[r - 1][c - 1] == 1) {  // 终点有障碍
             return path;
         }
         boolean[][] visit = new boolean[r][c];  // 记录数组
         backtrack(obstacleGrid, 0, 0, visit);
         return path;
     }

     public boolean backtrack(int[][] obstacleGrid, int x, int y, boolean[][] visit) {
         // 越界，有障碍，已访问
         if (x >= r || y >= c || obstacleGrid[x][y] == 1 || visit[x][y]) {
             return false;
         }
         // 如果不是以上情况，说明这个格子值得探索，做出选择
         path.add(Arrays.asList(x, y));
         visit[x][y] = true;
         // 选择后是否到达终点
         if (x == r - 1 && y == c - 1) {
             return true;
         }
         // 选择后没到终点，先尝试向下，再尝试向右，神奇的或运算
         if (backtrack(obstacleGrid, x + 1, y, visit) || backtrack(obstacleGrid, x, y + 1, visit)) {
             return true;
         }
         // 既不能向下也不能向右，是个死胡同，撤销选择
         path.remove(path.size() - 1);
         return false;
     }
 }

 作者：zui-weng-jiu-xian
 链接：https://leetcode-cn.com/problems/robot-in-a-grid-lcci/solution/mi-lu-de-ji-qi-ren-zhu-shi-xiang-xi-po-su-si-lu-by/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    
    var directions = [[0, 1], [1, 0]]
    var obstacleGrid = [[Int]]()
    var dp = [[Int]]()
    var ans = [[Int]]()
    
    func pathWithObstacles(_ obstacleGrid: [[Int]]) -> [[Int]] {
        if obstacleGrid[0][0] == 1 || obstacleGrid[obstacleGrid.count-1][obstacleGrid[0].count-1] == 1 {
            return ans
        }
        self.obstacleGrid = obstacleGrid
        dp = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        next(0, 0)
        return ans
    }
    
    func next(_ x: Int, _ y: Int) -> Bool {
        if x == obstacleGrid.count || y == obstacleGrid[0].count || obstacleGrid[x][y] == 1 || dp[x][y] == 1 {
            return false
        }
        
        dp[x][y] = 1
        ans.append([x, y])
        if x == obstacleGrid.count-1 && y == obstacleGrid[0].count-1 {
            return true
        }
        var res = false
        for dir in directions {
            res = res || next(x+dir[0], y+dir[1])
        }
        if !res {
            let _ = ans.removeLast()
        }
        return res
    }
}

let input = [[0,1],
             [0,0]]
//    [[0,0,0,0,0],[0,0,0,0,1],[0,0,0,1,0],[0,0,0,0,0]]
//    [[1]]
//[
//  [0,0,0],
//  [0,1,0],
//  [0,0,0]
//]

let solution = Solution()
let ans = solution.pathWithObstacles(input)
ans

//: [Next](@next)
