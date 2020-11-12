//: [Previous](@previous)

/*
 
 922. Sort Array By Parity II
 
 Given an array A of non-negative integers, half of the integers in A are odd, and half of the integers are even.

 Sort the array so that whenever A[i] is odd, i is odd; and whenever A[i] is even, i is even.

 You may return any answer array that satisfies this condition.

  

 Example 1:

 Input: [4,2,5,7]
 Output: [4,5,2,7]
 Explanation: [4,7,2,5], [2,5,4,7], [2,7,4,5] would also have been accepted.
  

 Note:

 2 <= A.length <= 20000
 A.length % 2 == 0
 0 <= A[i] <= 1000
 
 */

class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var ans = Array(repeating: 0, count: A.count)
        var io = 0, ie = 1
        for a in A {
            if a % 2 == 0 {
                ans[io] = a
                io += 2
            }
            if a % 2 == 1 {
                ans[ie] = a
                ie += 2
            }
        }
        return ans
    }
}

let solution = Solution()
let ans = solution.sortArrayByParityII([4,2,5,7])
ans

//: [Next](@next)
