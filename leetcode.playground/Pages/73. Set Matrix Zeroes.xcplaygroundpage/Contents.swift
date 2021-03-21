//: [Previous](@previous)

/*
 
 73. Set Matrix Zeroes
 
 Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.

 Follow up:

 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
  

 Example 1:


 Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
 Output: [[1,0,1],[0,0,0],[1,0,1]]
 Example 2:


 Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
 Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
  

 Constraints:

 m == matrix.length
 n == matrix[0].length
 1 <= m, n <= 200
 -231 <= matrix[i][j] <= 231 - 1
 
 */

/*
 
 class Solution {
 public:
     void setZeroes(vector<vector<int>>& matrix) {
         int m = matrix.size();
         int n = matrix[0].size();
         int flag_col0 = false;
         for (int i = 0; i < m; i++) {
             if (!matrix[i][0]) {
                 flag_col0 = true;
             }
             for (int j = 1; j < n; j++) {
                 if (!matrix[i][j]) {
                     matrix[i][0] = matrix[0][j] = 0;
                 }
             }
         }
         for (int i = m - 1; i >= 0; i--) {
             for (int j = 1; j < n; j++) {
                 if (!matrix[i][0] || !matrix[0][j]) {
                     matrix[i][j] = 0;
                 }
             }
             if (flag_col0) {
                 matrix[i][0] = 0;
             }
         }
     }
 };
 
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count, n = matrix.first?.count ?? 0
        var isCol0 = false
        
        for i in 0..<m {
            if matrix[i][0] == 0 {
                isCol0 = true
            }
            for j in 1..<n {
                if matrix[i][j] == 0 {
                    matrix[0][j] = 0
                    matrix[i][0] = 0
                }
            }
        }
        
        for i in stride(from: m - 1, to: -1, by: -1) {
            for j in stride(from: n - 1, to: 0, by: -1) {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
            if isCol0 {
                matrix[i][0] = 0
            }
        }
    }
}

//: [Next](@next)
