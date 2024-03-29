//: [Previous](@previous)

/*
 
 1035. Uncrossed Lines
 
 We write the integers of nums1 and nums2 (in the order they are given) on two separate horizontal lines.

 Now, we may draw connecting lines: a straight line connecting two numbers nums1[i] and nums2[j] such that:

 nums1[i] == nums2[j];
 The line we draw does not intersect any other connecting (non-horizontal) line.
 Note that a connecting lines cannot intersect even at the endpoints: each number can only belong to one connecting line.

 Return the maximum number of connecting lines we can draw in this way.

  

 Example 1:


 Input: nums1 = [1,4,2], nums2 = [1,2,4]
 Output: 2
 Explanation: We can draw 2 uncrossed lines as in the diagram.
 We cannot draw 3 uncrossed lines, because the line from nums1[1]=4 to nums2[2]=4 will intersect the line from nums1[2]=2 to nums2[1]=2.
 Example 2:

 Input: nums1 = [2,5,1,2,5], nums2 = [10,5,2,1,5,2]
 Output: 3
 Example 3:

 Input: nums1 = [1,3,7,1,7,5], nums2 = [1,9,2,5,1]
 Output: 2
  

 Note:

 1 <= nums1.length <= 500
 1 <= nums2.length <= 500
 1 <= nums1[i], nums2[i] <= 2000
 
 */

class Solution {
    func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: nums2.count), count: nums1.count)
        var ans = 0
        for i in 0..<nums1.count {
            for j in 0..<nums2.count {
                let val = nums1[i] == nums2[j] ? 1 : 0
                if i == 0 || j == 0 {
                    dp[i][j] = max(val, dp[max(0, i-1)][max(0, j-1)])
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1], dp[i-1][j-1] + val)
                }
                ans = max(ans, dp[i][j])
            }
        }
        return ans
    }
}

let nums1 = [2,5,1,2,5], nums2 = [10,5,2,1,5,2]
let solution = Solution()
let ans = solution.maxUncrossedLines(nums1, nums2)
ans

//: [Next](@next)
