//: [Previous](@previous)

/*
 1852. Distinct Numbers in Each Subarray
 中等
 Given an integer array nums and an integer k, you are asked to construct the array ans of size n-k+1 where ans[i] is the number of distinct numbers in the subarray nums[i:i+k-1] = [nums[i], nums[i+1], ..., nums[i+k-1]].

 Return the array ans.

  

 Example 1:

 Input: nums = [1,2,3,2,2,1,3], k = 3
 Output: [3,2,2,2,3]
 Explanation: The number of distinct elements in each subarray goes as follows:
 - nums[0:2] = [1,2,3] so ans[0] = 3
 - nums[1:3] = [2,3,2] so ans[1] = 2
 - nums[2:4] = [3,2,2] so ans[2] = 2
 - nums[3:5] = [2,2,1] so ans[3] = 2
 - nums[4:6] = [2,1,3] so ans[4] = 3
 Example 2:

 Input: nums = [1,1,1,1,2,3,4], k = 4
 Output: [1,2,3,4]
 Explanation: The number of distinct elements in each subarray goes as follows:
 - nums[0:3] = [1,1,1,1] so ans[0] = 1
 - nums[1:4] = [1,1,1,2] so ans[1] = 2
 - nums[2:5] = [1,1,2,3] so ans[2] = 3
 - nums[3:6] = [1,2,3,4] so ans[3] = 4
  

 Constraints:

 1 <= k <= nums.length <= 105
 1 <= nums[i] <= 105
 
 */

import Foundation

class Solution {
    func distinctNumbers(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var ans = Array(repeating: 0, count: n - k + 1)
        var cnt = [Int: Int]()
        for (i, num) in nums.enumerated() {
            cnt[num] = cnt[num, default: 0] + 1
            
            if i >= k - 1 {
                let j = i - k + 1
                ans[j] = cnt.count
                let val = cnt[nums[j], default: 0] - 1
                if val == 0 {
                    cnt.removeValue(forKey: nums[j])
                } else {
                    cnt[nums[j]] = val
                }
            }
        }
        return ans
    }
}

//: [Next](@next)
