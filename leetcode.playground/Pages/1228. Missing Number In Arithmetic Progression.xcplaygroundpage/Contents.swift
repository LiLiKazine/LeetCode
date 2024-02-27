//: [Previous](@previous)

/*
 1228. Missing Number In Arithmetic Progression
 简单
 In some array arr, the values were in arithmetic progression: the values arr[i + 1] - arr[i] are all equal for every 0 <= i < arr.length - 1.

 A value from arr was removed that was not the first or last value in the array.

 Given arr, return the removed value.

  

 Example 1:

 Input: arr = [5,7,11,13]
 Output: 9
 Explanation: The previous array was [5,7,9,11,13].
 Example 2:

 Input: arr = [15,13,12]
 Output: 14
 Explanation: The previous array was [15,14,13,12].
  

 Constraints:

 3 <= arr.length <= 1000
 0 <= arr[i] <= 105
 The given array is guaranteed to be a valid array.
 
 */

import Foundation

class Solution {
    func missingNumber(_ arr: [Int]) -> Int {
        let cnt = arr.count
        let k =  {
            if arr[0] > arr[cnt-1] {
                return max(arr[1] - arr[0], arr[cnt - 1] - arr[cnt - 2])
            } else {
                return min(arr[1] - arr[0], arr[cnt - 1] - arr[cnt - 2])
            }
        }()
        
        var low = 0, high = cnt - 1
        var ans = arr
        while low < high {
            let mid = low + (high - low) / 2
            let shouldBe = arr[0] + mid * k
            if arr[mid] == shouldBe {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return arr[0] + k * low
    }
}

//: [Next](@next)
