//: [Previous](@previous)

/*
 
 977. Squares of a Sorted Array
 
 Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

  

 Example 1:

 Input: [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Example 2:

 Input: [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
  

 Note:

 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 A is sorted in non-decreasing order.
 
 */

class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var negtives = [Int](), ascendent = [Int]()
        for i in 0..<A.count {
            if A[i] >= 0 {
                ascendent = Array(A[i..<A.count])
                break
            } else {
                negtives.insert(A[i], at: 0)
            }
        }
        var i = 0, j = 0
        while i < negtives.count {
            let val = negtives[i]
            while j < ascendent.count && ascendent[j] * ascendent[j] < val * val {
                j += 1
            }
            if j >= ascendent.count {
                ascendent.append(contentsOf: Array(negtives[i..<negtives.count]))
                break
            } else {
                ascendent.insert(val, at: j)
            }
            i += 1
        }
        return ascendent.map { $0 * $0 }
    }
}

let A = [-7,-3,2,3,11]

let solution = Solution()
let ans = solution.sortedSquares(A)
ans

//: [Next](@next)
