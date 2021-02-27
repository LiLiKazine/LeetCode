//: [Previous](@previous)

/*
 
 566. Reshape the Matrix
 
 In MATLAB, there is a very useful function called 'reshape', which can reshape a matrix into a new one with different size but keep its original data.

 You're given a matrix represented by a two-dimensional array, and two positive integers r and c representing the row number and column number of the wanted reshaped matrix, respectively.

 The reshaped matrix need to be filled with all the elements of the original matrix in the same row-traversing order as they were.

 If the 'reshape' operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.

 Example 1:
 Input:
 nums =
 [[1,2],
  [3,4]]
 r = 1, c = 4
 Output:
 [[1,2,3,4]]
 Explanation:
 The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a 1 * 4 matrix, fill it row by row by using the previous list.
 Example 2:
 Input:
 nums =
 [[1,2],
  [3,4]]
 r = 2, c = 4
 Output:
 [[1,2],
  [3,4]]
 Explanation:
 There is no way to reshape a 2 * 2 matrix to a 2 * 4 matrix. So output the original matrix.
 Note:
 The height and width of the given matrix is in range [1, 100].
 The given r and c are all positive.
 
 */

class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let count = nums.count * (nums.first?.count ?? 0)
        guard count >= r * c else {
            return nums
        }
        var ans: [[Int]] = Array(repeating: Array(repeating: 0, count: c), count: r)
        out: for i in 0..<nums.count {
            for j in 0..<nums[i].count {
                let index = i * nums[i].count + j
                if index == r * c {
                    break out
                }
                ans[index/c][index%c] = nums[i][j]
            }
        }
        return ans
    }
}

let  nums =
    [[1,2],
     [3,4]],
    r = 1, c = 4
let solution = Solution()
let ans = solution.matrixReshape(nums, r, c)
ans

//: [Next](@next)
