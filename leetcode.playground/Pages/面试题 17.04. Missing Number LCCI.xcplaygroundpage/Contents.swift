//: [Previous](@previous)

/*
 
 面试题 17.04. Missing Number LCCI
 
 An array contains all the integers from 0 to n, except for one number which is missing.  Write code to find the missing integer. Can you do it in O(n) time?

 Note: This problem is slightly different from the original one the book.

 Example 1:

 Input: [3,0,1]
 Output: 2
  

 Example 2:

 Input: [9,6,4,2,3,5,7,0,1]
 Output: 8
 
 */

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var arr = Array(repeating: -1, count: nums.count)
        for n in nums {
            arr[n] = n
        }
        for i in 0..<arr.count {
            if arr[i] == -1 {
                return i
            }
        }
        return 0
    }
}

//: [Next](@next)
