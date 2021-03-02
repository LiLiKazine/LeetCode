//: [Previous](@previous)

/*
 
 304. Range Sum Query 2D - Immutable
 
 Given a 2D matrix matrix, find the sum of the elements inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).

 Range Sum Query 2D
 The above rectangle (with the red border) is defined by (row1, col1) = (2, 1) and (row2, col2) = (4, 3), which contains sum = 8.

 Example:
 Given matrix = [
   [3, 0, 1, 4, 2],
   [5, 6, 3, 2, 1],
   [1, 2, 0, 1, 5],
   [4, 1, 0, 1, 7],
   [1, 0, 3, 0, 5]
 ]

 sumRegion(2, 1, 4, 3) -> 8
 sumRegion(1, 1, 2, 2) -> 11
 sumRegion(1, 2, 2, 4) -> 12
 Note:
 You may assume that the matrix does not change.
 There are many calls to sumRegion function.
 You may assume that row1 ≤ row2 and col1 ≤ col2.
 
 */

class NumMatrix {
    
    private var sums:[[Int]] = []

    init(_ matrix: [[Int]]) {
        for i in 0..<matrix.count {
            sums.append(Array(repeating: 0, count: matrix[i].count))
            for j in 0..<matrix[i].count {
                var sum = 0
                if i > 0 {
                    sum += sums[i-1][j]
                }
                if j > 0 {
                    sum += sums[i][j-1]
                }
                if i > 0 && j > 0 {
                    sum -= sums[i-1][j-1]
                }
                sum += matrix[i][j]
                sums[i][j] = sum
            }
        }

    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var ans = sums[row2][col2]
        if row1 > 0 {
            ans -= sums[row1-1][col2]
        }
        if col1 > 0 {
            ans -= sums[row2][col1-1]
        }
        if col1 > 0 && row1 > 0 {
            ans += sums[row1-1][col1-1]
        }
        return ans
    }
}

let matrix = [
    [3, 0, 1, 4, 2],
    [5, 6, 3, 2, 1],
    [1, 2, 0, 1, 5],
    [4, 1, 0, 1, 7],
    [1, 0, 3, 0, 5]
  ]
let obj = NumMatrix(matrix)
let ret_1: Int = obj.sumRegion(2, 1, 4, 3)
//sumRegion(1, 1, 2, 2)
//sumRegion(1, 2, 2, 4)

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */


//: [Next](@next)
