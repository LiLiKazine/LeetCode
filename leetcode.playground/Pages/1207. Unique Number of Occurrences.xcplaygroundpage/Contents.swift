//: [Previous](@previous)

/*
 
 1207. Unique Number of Occurrences
 
 Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.

  

 Example 1:

 Input: arr = [1,2,2,1,1,3]
 Output: true
 Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
 Example 2:

 Input: arr = [1,2]
 Output: false
 Example 3:

 Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
 Output: true
  

 Constraints:

 1 <= arr.length <= 1000
 -1000 <= arr[i] <= 1000
 
 */

class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var hash = [Int: Int]()
        for num in arr {
            if hash[num] != nil {
                hash[num] = hash[num]! + 1
            } else {
                hash[num] = 1
            }
        }
        let occurrences = hash.values.sorted()
        if occurrences.count <= 1 {
            return true
        }
        for i in 1..<occurrences.count {
            if occurrences[i] == occurrences[i-1] {
                return false
            }
        }
        return true
    }
}

//: [Next](@next)
