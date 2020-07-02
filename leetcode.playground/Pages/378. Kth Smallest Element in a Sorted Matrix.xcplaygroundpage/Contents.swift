//: [Previous](@previous)

/*
 378. Kth Smallest Element in a Sorted Matrix
 
 Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.

 Note that it is the kth smallest element in the sorted order, not the kth distinct element.

 Example:

 matrix = [
    [ 1,  5,  9],
    [10, 11, 13],
    [12, 13, 15]
 ],
 k = 8,

 return 13.
 Note:
 You may assume k is always valid, 1 ≤ k ≤ n2.

 */

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let numOfRow = matrix.first?.count ?? 0
        let numOfColumn = matrix.count
        var left = matrix[0][0],
        right = matrix[numOfColumn-1][numOfRow-1]
        
        while left < right {
            let mid = left + (right - left) / 2
            let res = checkSum(matrix, mid, k)
            if res {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func checkSum(_ matrix: [[Int]], _ mid: Int, _ k: Int) -> Bool {
        var sum = 0
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] <= mid {
                   sum += 1
                } else {
                    break
                }
            }
        }
        return sum < k
    }
}


let matrix = [[1,2],[1,3]]
let k = 3
let solution = Solution()
let ans = solution.kthSmallest(matrix, k)
ans

//: [Next](@next)
