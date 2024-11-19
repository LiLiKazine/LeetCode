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
        let n = matrix.count
        func check(_ x: Int) -> Bool {//至少有k个数不大于x
            var res = 0, r = n - 1, c = 0
            while r >= 0, c < n {
                if matrix[r][c] <= x {
                    res += r + 1
                    c += 1
                } else {
                    r -= 1
                }
            }
            return res >= k
        }
        var l = matrix[0][0], r = matrix[n-1][n-1]
        while l <= r {
            let mid = l + (r - l) / 2
            if check(mid) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}


let matrix = [[1,2],[1,3]]
let k = 3
let solution = Solution()
let ans = solution.kthSmallest(matrix, k)
ans

//: [Next](@next)
