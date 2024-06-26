//: [Previous](@previous)

/*
 48. Rotate Image
 
 You are given an n x n 2D matrix representing an image.

 Rotate the image by 90 degrees (clockwise).

 Note:

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

 Example 1:

 Given input matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 rotate the input matrix in-place such that it becomes:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 Example 2:

 Given input matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],
 
 [15,14,12,16]
 [13, 3, 6, 7]
 [ 2, 4, 8,10]
 [ 5, 1, 9,11]
 rotate the input matrix in-place such that it becomes:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]
 
 */

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            for j in 0...i {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        for i in 0..<matrix.count {
            for j in 0..<(matrix[i].count/2) {
                let temp = matrix[i][j]
                let k = matrix[i].count - j - 1
                matrix[i][j] = matrix[i][k]
                matrix[i][k] = temp
            }
        }
    }
}

let test = Solution()
var matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
test.rotate(&matrix)
matrix
//: [Next](@next)
