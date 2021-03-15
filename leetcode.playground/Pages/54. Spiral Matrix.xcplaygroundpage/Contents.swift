//: [Previous](@previous)

/*
 54. Spiral Matrix
 
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

 Example 1:

 Input:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:

 Input:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 */

/*
 
 class Solution {
 public:
     vector<int> spiralOrder(vector<vector<int>>& matrix) {
         if (matrix.size() == 0 || matrix[0].size() == 0) {
             return {};
         }

         int rows = matrix.size(), columns = matrix[0].size();
         vector<int> order;
         int left = 0, right = columns - 1, top = 0, bottom = rows - 1;
         while (left <= right && top <= bottom) {
             for (int column = left; column <= right; column++) {
                 order.push_back(matrix[top][column]);
             }
             for (int row = top + 1; row <= bottom; row++) {
                 order.push_back(matrix[row][right]);
             }
             if (left < right && top < bottom) {
                 for (int column = right - 1; column > left; column--) {
                     order.push_back(matrix[bottom][column]);
                 }
                 for (int row = bottom; row > top; row--) {
                     order.push_back(matrix[row][left]);
                 }
             }
             left++;
             right--;
             top++;
             bottom--;
         }
         return order;
     }
 };
 
 */

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let maxRow = matrix.count, maxCol = matrix.first?.count ?? 0
        var ans: [Int] = [],
            left = 0, right = maxCol - 1, top = 0, bottom = maxRow - 1
        while left <= right && top <= bottom {
            for i in left...right {
                ans.append(matrix[top][i])
            }
            if top + 1 <= bottom {
                for i in (top + 1)...bottom {
                    ans.append(matrix[i][right])
                }
            }
            if left < right && top < bottom {
                for i in stride(from: right - 1, to: left, by: -1) {
                    ans.append(matrix[bottom][i])
                }
                for i in stride(from: bottom, to: top, by: -1) {
                    ans.append(matrix[i][left])
                }
            }
            left += 1
            right -= 1
            top += 1
            bottom -= 1
        }
        return ans
    }
}

let matrix = [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
   ]
let solution = Solution()
let ans = solution.spiralOrder(matrix)
ans

//: [Next](@next)
