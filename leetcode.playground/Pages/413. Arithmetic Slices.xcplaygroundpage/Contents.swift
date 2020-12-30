//: [Previous](@previous)

/*
 
 413. Arithmetic Slices
 
 A sequence of numbers is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.

 For example, these are arithmetic sequences:

 1, 3, 5, 7, 9
 7, 7, 7, 7
 3, -1, -5, -9
 The following sequence is not arithmetic.

 1, 1, 2, 5, 7
  
 A zero-indexed array A consisting of N numbers is given. A slice of that array is any pair of integers (P, Q) such that 0 <= P < Q < N.

 A slice (P, Q) of the array A is called arithmetic if the sequence:
 A[P], A[P + 1], ..., A[Q - 1], A[Q] is arithmetic. In particular, this means that P + 1 < Q.

 The function should return the number of arithmetic slices in the array A.

  
 Example:

 A = [1, 2, 3, 4]

 return: 3, for 3 arithmetic slices in A: [1, 2, 3], [2, 3, 4] and [1, 2, 3, 4] itself.
 
 */

class Solution {
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        var ans: Int = 0, start = 0
        while start < A.count - 2 {
            var tail = start + 2
            if tail < A.count && A[tail] - A[tail-1] ==  A[tail-1] - A[start] {
                ans += 1
                tail += 1
            } else {
                start += 1
                continue
            }
            while tail < A.count {
                if A[tail] - A[tail-1] == A[start + 1] - A[start] {
                    ans += 1
                    tail += 1
                } else {
                    break
                }
            }
            start += 1
        }
        
        return ans
    }
}

let A = [1, 2, 3, 4]
let solution = Solution()
let ans = solution.numberOfArithmeticSlices(A)
ans

//: [Next](@next)
