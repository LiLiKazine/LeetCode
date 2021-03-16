//: [Previous](@previous)

/*
 
 59. Spiral Matrix II
 
 Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

  

 Example 1:


 Input: n = 3
 Output: [[1,2,3],[8,9,4],[7,6,5]]
 Example 2:

 Input: n = 1
 Output: [[1]]
  

 Constraints:

 1 <= n <= 20
 
 */

/*
 
 class Solution {
 public:
     vector<vector<int>> generateMatrix(int n) {
         int maxNum = n * n;
         int curNum = 1;
         vector<vector<int>> matrix(n, vector<int>(n));
         int row = 0, column = 0;
         vector<vector<int>> directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};  // 右下左上
         int directionIndex = 0;
         while (curNum <= maxNum) {
             matrix[row][column] = curNum;
             curNum++;
             int nextRow = row + directions[directionIndex][0], nextColumn = column + directions[directionIndex][1];
             if (nextRow < 0 || nextRow >= n || nextColumn < 0 || nextColumn >= n || matrix[nextRow][nextColumn] != 0) {
                 directionIndex = (directionIndex + 1) % 4;  // 顺时针旋转至下一个方向
             }
             row = row + directions[directionIndex][0];
             column = column + directions[directionIndex][1];
         }
         return matrix;
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/spiral-matrix-ii/solution/luo-xuan-ju-zhen-ii-by-leetcode-solution-f7fp/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        guard n > 0 else {
            return []
        }
        var ans: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n), dirs: [[Int]] = [[0, 1], [1, 0], [0, -1], [-1, 0]], row = 0, col = 0, i = 1, dir = 0
        while i <= n * n {
            ans[row][col] = i
            i += 1
            let nexRow = row + dirs[dir][0], nexCol = col + dirs[dir][1]
            if nexRow < 0 || nexRow >= n || nexCol < 0 || nexCol >= n || ans[nexRow][nexCol] != 0 {
                dir = (dir + 1) % 4
            }
            row += dirs[dir][0]
            col += dirs[dir][1]
        }
        return ans
    }
}

let n = 3
let solution = Solution()
let ans = solution.generateMatrix(n)
ans

//: [Next](@next)
