//: [Previous](@previous)

/*
 
 978. Longest Turbulent Subarray
 
 Given an integer array arr, return the length of a maximum size turbulent subarray of arr.

 A subarray is turbulent if the comparison sign flips between each adjacent pair of elements in the subarray.

 More formally, a subarray [arr[i], arr[i + 1], ..., arr[j]] of arr is said to be turbulent if and only if:

 For i <= k < j:
 arr[k] > arr[k + 1] when k is odd, and
 arr[k] < arr[k + 1] when k is even.
 Or, for i <= k < j:
 arr[k] > arr[k + 1] when k is even, and
 arr[k] < arr[k + 1] when k is odd.
  

 Example 1:

 Input: arr = [9,4,2,10,7,8,8,1,9]
 Output: 5
 Explanation: arr[1] > arr[2] < arr[3] > arr[4] < arr[5]
 Example 2:

 Input: arr = [4,8,12,16]
 Output: 2
 Example 3:

 Input: arr = [100]
 Output: 1
  

 Constraints:

 1 <= arr.length <= 4 * 104
 0 <= arr[i] <= 109
 
 */
// 1 3 1 4 4 1 3 2 6 1
//  1 2 1 0 2 1 2 1 2
class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        var transformed: [Int] = [], left = 0, right = 0, ans = 0
        for i in 1..<arr.count {
            if arr[i] == arr[i - 1] {
                transformed.append(0)
            } else if arr[i] > arr[i - 1] {
                transformed.append(1)
            } else {
                transformed.append(2)
            }
        }
        print(transformed)
        while right < transformed.count {
            if transformed[right] == 0 {
                ans = max(ans, right - left + 1)
                right += 1
                left = right
                continue
            }
            if right > left && transformed[right] == transformed[right - 1] {
                ans = max(ans, right - left + 1)
                left = right
                continue
            }
            if left == right || transformed[right] != transformed[right - 1] {
                right += 1
                continue
            }
            
            
          
        }
        ans = max(right - left + 1, ans)
        return ans
    }
}

//let arr = [9,4,2,10,7,8,8,1,9]
let arr = [9, 9]
let solution = Solution()
let ans = solution.maxTurbulenceSize(arr)
ans

//: [Next](@next)
