//: [Previous](@previous)

/*
 
 941. Valid Mountain Array
 
 Given an array A of integers, return true if and only if it is a valid mountain array.

 Recall that A is a mountain array if and only if:

 A.length >= 3
 There exists some i with 0 < i < A.length - 1 such that:
 A[0] < A[1] < ... A[i-1] < A[i]
 A[i] > A[i+1] > ... > A[A.length - 1]


  

 Example 1:

 Input: [2,1]
 Output: false
 Example 2:

 Input: [3,5,5]
 Output: false
 Example 3:

 Input: [0,3,2,1]
 Output: true
  

 Note:

 0 <= A.length <= 10000
 0 <= A[i] <= 10000
 
 */
class Solution {
    func validMountainArray(_ A: [Int]) -> Bool {
        guard A.count > 2 else {
            return false
        }
        var dir = 1
        for i in 1..<A.count {
            if A[i] > A[i-1] && dir > 0 {
                continue
            }
            if A[i] < A[i-1] && dir > 0 {
                if i == 1 {
                    return false
                }
                dir = -1
                continue
            }
            if A[i] < A[i-1] && dir < 0 {
                continue
            }
            return false
        }
        return dir < 0
    }
}

let A = [0,3,2,1]
let solution = Solution()
let ans = solution.validMountainArray(A)
ans

//: [Next](@next)
