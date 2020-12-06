//: [Previous](@previous)

/*
 
 118. Pascal's Triangle
 
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.


 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Example:

 Input: 5
 Output:
 [
      [1],
     [1,1],
    [1,2,1],
   [1,3,3,1],
  [1,4,6,4,1]
 ]
 
 */

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var ans: [[Int]] = []
        for i in 0..<numRows {
            var lev: [Int] = []
            for j in 0...i {
                if j == 0 {
                    lev.append(1)
                } else if j == i {
                    lev.append(1)
                } else {
                    lev.append(ans.last![j-1] + ans.last![j])
                }
            }
            ans.append(lev)
        }
        return ans
    }
}

//: [Next](@next)
