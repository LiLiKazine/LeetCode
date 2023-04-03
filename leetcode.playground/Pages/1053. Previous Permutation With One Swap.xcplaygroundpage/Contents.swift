//: [Previous](@previous)

/*
 
 1053. Previous Permutation With One Swap
 
 Given an array of positive integers arr (not necessarily distinct), return the lexicographically largest permutation that is smaller than arr, that can be made with exactly one swap. If it cannot be done, then return the same array.

 Note that a swap exchanges the positions of two numbers arr[i] and arr[j]

  

 Example 1:

 Input: arr = [3,2,1]
 Output: [3,1,2]
 Explanation: Swapping 2 and 1.
 Example 2:

 Input: arr = [1,1,5]
 Output: [1,1,5]
 Explanation: This is already the smallest permutation.
 Example 3:

 Input: arr = [1,9,4,6,7]
 Output: [1,7,4,6,9]
 Explanation: Swapping 9 and 7.
  

 Constraints:

 1 <= arr.length <= 104
 1 <= arr[i] <= 104
 
 */

class Solution {
    func prevPermOpt1(_ arr: [Int]) -> [Int] {
        guard arr.count > 1 else { return arr }
        
        for i in stride(from: arr.count-2, to: -1, by: -1) {
            for j in stride(from: arr.count-1, to: i, by: -1) {
                if arr[i] <= arr[i+1] {
                    break
                }
                if arr[i] > arr[j] && arr[j-1] != arr[j] {
                    var ans = arr
                    ans.swapAt(i, j)
                    return ans
                }
                
            }
        }
        
        return arr

    }
}

//let arr = [3,2,1]
//let arr = [1,1,5]
//let arr = [1,9,4,6,7]
let arr = [3,1,1,3]
let solution = Solution()
let ans = solution.prevPermOpt1(arr)

print(ans)

//: [Next](@next)
