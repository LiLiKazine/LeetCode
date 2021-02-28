//: [Previous](@previous)

/*
 
 896. Monotonic Array
 
 An array is monotonic if it is either monotone increasing or monotone decreasing.

 An array A is monotone increasing if for all i <= j, A[i] <= A[j].  An array A is monotone decreasing if for all i <= j, A[i] >= A[j].

 Return true if and only if the given array A is monotonic.

  

 Example 1:

 Input: [1,2,2,3]
 Output: true
 Example 2:

 Input: [6,5,4,4]
 Output: true
 Example 3:

 Input: [1,3,2]
 Output: false
 Example 4:

 Input: [1,2,4,5]
 Output: true
 Example 5:

 Input: [1,1,1]
 Output: true
  

 Note:

 1 <= A.length <= 50000
 -100000 <= A[i] <= 100000
 
 */

class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        guard A.count > 2 else {
            return true
        }
        var isDec: Bool = false, isInc: Bool = false
        for i in 1..<A.count {
            let dif = A[i] - A[i-1]
            if dif < 0 {
                isDec = true
            }
            if dif > 0 {
                isInc = true
            }
        }
        return !(isDec && isInc)
    }
}

//let A = [1,2,2,3]
//let A = [6,5,4,4]
let A = [1, 3, 2]
let solution = Solution()
let ans = solution.isMonotonic(A)
ans

//: [Next](@next)
