//: [Previous](@previous)

/*
 910. Smallest Range II
 中等
 You are given an integer array nums and an integer k.

 For each index i where 0 <= i < nums.length, change nums[i] to be either nums[i] + k or nums[i] - k.

 The score of nums is the difference between the maximum and minimum elements in nums.

 Return the minimum score of nums after changing the values at each index.

  

 Example 1:

 Input: nums = [1], k = 0
 Output: 0
 Explanation: The score is max(nums) - min(nums) = 1 - 1 = 0.
 Example 2:

 Input: nums = [0,10], k = 2
 Output: 6
 Explanation: Change nums to be [2, 8]. The score is max(nums) - min(nums) = 8 - 2 = 6.
 Example 3:

 Input: nums = [1,3,6], k = 3
 Output: 3
 Explanation: Change nums to be [4, 6, 3]. The score is max(nums) - min(nums) = 6 - 3 = 3.
  

 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 104
 0 <= k <= 104
 
 */
/*
class Solution {
public:
    int smallestRangeII(vector<int>& nums, int k) {
        int n = nums.size(); // 获取数组的大小
        sort(nums.begin(), nums.end()); // 将数组按升序排序
        int ans = nums[n - 1] - nums[0]; // 初始的最大值差，未做任何调整时的最大减最小
       
        // 遍历数组，从第二个元素开始到最后一个元素
        for(int i = 1; i < n; i++) {
            // 在每次迭代中，计算调整后区间的最大和最小值
            // max(nums[n - 1] - k, nums[i - 1] + k): 调整后的最大值，要么是原数组最大值减去k，要么是当前遍历到的前一个元素加上k
            // min(nums[0] + k, nums[i] - k): 调整后的最小值，要么是原数组最小值加上k，要么是当前遍历到的元素减去k
            // ans: 取每次计算结果中的最小值
            ans = min(ans, max(nums[n - 1] - k, nums[i - 1] + k) - min(nums[0] + k, nums[i] - k));
        }
        
        return ans; // 返回最小的区间差值
    }
};
*/
import Foundation

class Solution {
    func smallestRangeII(_ nums: [Int], _ k: Int) -> Int {
        let len = nums.count
        let nums = nums.sorted()
        var ans = nums[len - 1] - nums[0]
        
        for i in 1..<len {
            ans = min(ans, max(nums[len - 1] - k, nums[i - 1] + k) - min(nums[0] + k, nums[i] - k))
        }
        
        return ans
    }
}

//: [Next](@next)
