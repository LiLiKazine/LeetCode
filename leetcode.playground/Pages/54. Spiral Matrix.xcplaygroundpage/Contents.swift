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

import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0, matrix[0].count > 0 else {
            return []
        }
        let directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        var minRow = 0, minColumn = 0
        var maxRow = matrix.count - 1, maxColumn = matrix[0].count - 1
        var current = [0, 0]
        var ans = [matrix[0][0]]
        
        func next(_ current: [Int], _ direction: [Int]) -> [Int]? {
            let p = [current[0] + direction[0], current[1] + direction[1]]
            if p[0] >= minRow && p[0] <= maxRow && p[1] >= minColumn && p[1] <= maxColumn {
                return p
            }
            return nil
        }
        while minRow <= maxRow && minColumn <= maxColumn {
            for direction in directions {
                while let next = next(current, direction) {
                    current = next
                    ans.append(matrix[current[0]][current[1]])
                }
                if direction[0] < 0 {
                    minColumn += 1
                }
                if direction[0] > 0 {
                    maxColumn -= 1
                }
                if direction[1] > 0 {
                    minRow += 1
                }
                if direction[1] < 0 {
                    maxRow -= 1
                }
            }
            
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
