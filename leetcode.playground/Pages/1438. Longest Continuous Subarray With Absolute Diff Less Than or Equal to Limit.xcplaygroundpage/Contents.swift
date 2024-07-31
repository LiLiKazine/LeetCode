//: [Previous](@previous)

/*
 
 1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit
 
 Given an array of integers nums and an integer limit, return the size of the longest non-empty subarray such that the absolute difference between any two elements of this subarray is less than or equal to limit.

  

 Example 1:

 Input: nums = [8,2,4,7], limit = 4
 Output: 2
 Explanation: All subarrays are:
 [8] with maximum absolute diff |8-8| = 0 <= 4.
 [8,2] with maximum absolute diff |8-2| = 6 > 4.
 [8,2,4] with maximum absolute diff |8-2| = 6 > 4.
 [8,2,4,7] with maximum absolute diff |8-2| = 6 > 4.
 [2] with maximum absolute diff |2-2| = 0 <= 4.
 [2,4] with maximum absolute diff |2-4| = 2 <= 4.
 [2,4,7] with maximum absolute diff |2-7| = 5 > 4.
 [4] with maximum absolute diff |4-4| = 0 <= 4.
 [4,7] with maximum absolute diff |4-7| = 3 <= 4.
 [7] with maximum absolute diff |7-7| = 0 <= 4.
 Therefore, the size of the longest subarray is 2.
 Example 2:

 Input: nums = [10,1,2,4,7,2], limit = 5
 Output: 4
 Explanation: The subarray [2,4,7,2] is the longest since the maximum absolute diff is |2-7| = 5 <= 5.
 Example 3:

 Input: nums = [4,2,2,2,4,4,2,2], limit = 0
 Output: 3
  

 Constraints:

 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^9
 0 <= limit <= 10^9
 
 */

class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var ans = 1, start = 0
        var ascend = [Int]()
        var descend = [Int]()
        for (i, val) in nums.enumerated() {
            while ascend.count > 0 && nums[ascend.last!] > val {
                ascend.removeLast()
            }
            ascend.append(i)
            while descend.count > 0 && nums[descend.last!] < val {
                descend.removeLast()
            }
            descend.append(i)
            while start < i && (abs(val - nums[ascend[0]]) > limit || abs(val - nums[descend[0]]) > limit) {
                if ascend[0] == start {
                    ascend.removeFirst()
                }
                if descend[0] == start {
                    descend.removeFirst()
                }
                start += 1
            }
            ans = max(ans, i - start + 1)
        }
        
        return ans
    }
}

let nums = [8,2,4,7], limit = 4
let solution = Solution()
let ans = solution.longestSubarray(nums, limit)
ans

//: [Next](@next)
