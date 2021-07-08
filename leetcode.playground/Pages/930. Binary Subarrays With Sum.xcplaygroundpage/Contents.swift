//: [Previous](@previous)

/*
 
 930. Binary Subarrays With Sum
 
 Given a binary array nums and an integer goal, return the number of non-empty subarrays with a sum goal.

 A subarray is a contiguous part of the array.

  

 Example 1:

 Input: nums = [1,0,1,0,1], goal = 2
 Output: 4
 Explanation: The 4 subarrays are bolded and underlined below:
 [1,0,1,0,1]
 [1,0,1,0,1]
 [1,0,1,0,1]
 [1,0,1,0,1]
 Example 2:

 Input: nums = [0,0,0,0,0], goal = 0
 Output: 15
  

 Constraints:

 1 <= nums.length <= 3 * 104
 nums[i] is either 0 or 1.
 0 <= goal <= nums.length
 
 */

/*
 
 class Solution {
 public:
     int numSubarraysWithSum(vector<int>& nums, int goal) {
         int sum = 0;
         unordered_map<int, int> cnt;
         int ret = 0;
         for (auto& num : nums) {
             cnt[sum]++;
             sum += num;
             ret += cnt[sum - goal];
         }
         return ret;
     }
 };
 
 */

class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var preSums: [Int: Int] = [:], ans = 0, sum = 0
        for num in nums {
            preSums[sum] = (preSums[sum] ?? 0) + 1
            sum += num
            ans += preSums[sum - goal] ?? 0
        }
        return ans
    }
}

let nums = [1,0,1,0,1], goal = 2
let solution = Solution()
let ans = solution.numSubarraysWithSum(nums, goal)
ans

//: [Next](@next)
