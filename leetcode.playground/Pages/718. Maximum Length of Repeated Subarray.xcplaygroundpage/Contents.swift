//: [Previous](@previous)

/*
 
 718. Maximum Length of Repeated Subarray
 
 Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

 Example 1:

 Input:
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 Output: 3
 Explanation:
 The repeated subarray with maximum length is [3, 2, 1].
  

 Note:

 1 <= len(A), len(B) <= 1000
 0 <= A[i], B[i] < 100
 
 */

class Solution {
    
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        var cache: [[Int]] = Array(repeating: Array(repeating: 0, count: B.count), count: A.count)
        var i2 = 0, j2 = 0,
        ans = 0
        for i1 in 0..<A.count {
            for j1 in 0..<B.count {
                if cache[i1][j1] > 0 {
                    continue
                }
                guard A[i1] == B[j1] else {
                    continue
                }
                i2 = i1
                j2 = j1
                while i2 < A.count && j2 < B.count {
                    if A[i2] == B[j2] {
                        cache[i2][j2] = i2 - i1 + 1
                        ans = max(ans, cache[i2][j2])
                        i2 += 1
                        j2 += 1
                    } else {
                        break
                    }
                }
                
            }
        }
        return ans
    }
}

let solution = Solution()
let ans = solution.findLength([1,2,3,2,1], [3,2,1,4,7])
ans

//: [Next](@next)
