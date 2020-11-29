//: [Previous](@previous)

/*
 
 976. Largest Perimeter Triangle
 
 Given an array A of positive lengths, return the largest perimeter of a triangle with non-zero area, formed from 3 of these lengths.

 If it is impossible to form any triangle of non-zero area, return 0.

  

 Example 1:

 Input: [2,1,2]
 Output: 5
 Example 2:

 Input: [1,2,1]
 Output: 0
 Example 3:

 Input: [3,2,3,4]
 Output: 10
 Example 4:

 Input: [3,6,2,3]
 Output: 8
  

 Note:

 3 <= A.length <= 10000
 1 <= A[i] <= 10^6
 
 */

class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        var A = A.sorted(by: >)
        for i in 0..<A.count - 2 {
            let a = A[i]
            let b = A[i+1]
            let c = A[i+2]
            if a < b + c {
                return a + b + c
            }
        }
        return 0
    }
}

//: [Next](@next)
