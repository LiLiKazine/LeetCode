//: [Previous](@previous)

/*
 1538. Guess the Majority in a Hidden Array
 中等
 We have an integer array nums, where all the integers in nums are 0 or 1. You will not be given direct access to the array, instead, you will have an API ArrayReader which have the following functions:

 int query(int a, int b, int c, int d): where 0 <= a < b < c < d < ArrayReader.length(). The function returns the distribution of the value of the 4 elements and returns:
 4 : if the values of the 4 elements are the same (0 or 1).
 2 : if three elements have a value equal to 0 and one element has value equal to 1 or vice versa.
 0 : if two element have a value equal to 0 and two elements have a value equal to 1.
 int length(): Returns the size of the array.
 You are allowed to call query() 2 * n times at most where n is equal to ArrayReader.length().

 Return any index of the most frequent value in nums, in case of tie, return -1.

  

 Example 1:

 Input: nums = [0,0,1,0,1,1,1,1]
 Output: 5
 Explanation: The following calls to the API
 reader.length() // returns 8 because there are 8 elements in the hidden array.
 reader.query(0,1,2,3) // returns 2 this is a query that compares the elements nums[0], nums[1], nums[2], nums[3]
 // Three elements have a value equal to 0 and one element has value equal to 1 or viceversa.
 reader.query(4,5,6,7) // returns 4 because nums[4], nums[5], nums[6], nums[7] have the same value.
 we can infer that the most frequent value is found in the last 4 elements.
 Index 2, 4, 6, 7 is also a correct answer.
 Example 2:

 Input: nums = [0,0,1,1,0]
 Output: 0
 Example 3:

 Input: nums = [1,0,1,0,1,0,1,0]
 Output: -1
  

 Constraints:

 5 <= nums.length <= 105
 0 <= nums[i] <= 1
 
 */

import Foundation

protocol ArrayReader {
    // Compares 4 different elements in the array
    // return 4 if the values of the 4 elements are the same (0 or 1).
    // return 2 if three elements have a value equal to 0 and one element has value equal to 1 or vice versa.
    // return 0 : if two element have a value equal to 0 and two elements have a value equal to 1.
    public func query(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int
    
    // Returns the length of the array
    public func length() -> Int
}


class Solution {
    func guessMajority(_ reader: ArrayReader) -> Int {
        let len = reader.length()
        var arr = Array(repeating: 0, count: len)
        arr[0] = 1
        let q0123 = reader.query(0, 1, 2, 3)
        let q1234 = reader.query(1, 2, 3, 4)
        arr[4] = q0123 == q1234 ? 1 : 0
        let q0234 = reader.query(0, 2, 3, 4)
        arr[1] = q0123 == q0234 ? arr[4] : abs(1 - arr[4])
        let q0134 = reader.query(0, 1, 3, 4)
        arr[2] = q0234 == q0134 ? arr[1] : abs(1 - arr[1])
        let q0124 = reader.query(0, 1, 2, 4)
        arr[3] = q0124 == q0134 ? arr[2] : abs(1 - arr[2])
        var last = q1234
        for i in 5..<len {
            let res = reader.query(i - 3, i - 2, i - 1, i)
            arr[5] = res == last ? arr[i-4] : abs(1-arr[i-4])
            last = res
        }
        var major0 = 0, major1 = 0
        for val in arr {
            if val == 0 {
                major0 += 1
            } else {
                major1 += 1
            }
        }
        if major0 == major1 {
            return -1
        }
        let major: Int = {
            return major0 > major1 ? 0 : 1
        }
        for i in 0..<arr.count {
            if arr[i] == major {
                return i
            }
        }
        return -1
    }
}

//: [Next](@next)
