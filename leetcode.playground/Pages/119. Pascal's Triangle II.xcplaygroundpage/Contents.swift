//: [Previous](@previous)

/*
 
 119. Pascal's Triangle II
 
 Given an integer rowIndex, return the rowIndexth row of the Pascal's triangle.

 Notice that the row index starts from 0.


 In Pascal's triangle, each number is the sum of the two numbers directly above it.

 Follow up:

 Could you optimize your algorithm to use only O(k) extra space?

  

 Example 1:

 Input: rowIndex = 3
 Output: [1,3,3,1]
 Example 2:

 Input: rowIndex = 0
 Output: [1]
 Example 3:

 Input: rowIndex = 1
 Output: [1,1]
  

 Constraints:

 0 <= rowIndex <= 33
 
 */

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        let n = rowIndex + 1
        if n == 1 {
            return [1]
        } else if n == 2 {
            return [1, 1]
        }
        var ans: [Int] = [1, 1]
        for _ in 3...n {
            var temp: [Int] = [1]
            for i in 1..<ans.count {
                temp.append(ans[i] + ans[i-1])
            }
            temp.append(1)
            ans = temp
        }
        return ans
    }
}

let solution = Solution()
let ans = solution.getRow(3)
ans

//: [Next](@next)
