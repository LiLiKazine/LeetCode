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
     public int numSubarraysWithSum(int[] nums, int t) {
         int n = nums.length;
         int ans = 0;
         for (int r = 0, l1 = 0, l2 = 0, s1 = 0, s2 = 0; r < n; r++) {
             s1 += nums[r];
             s2 += nums[r];
             while (l1 <= r && s1 > t) s1 -= nums[l1++];
             while (l2 <= r && s2 >= t) s2 -= nums[l2++];
             ans += l2 - l1;
         }
         return ans;
     }
 }
 class Solution {
 public:
     int numSubarraysWithSum(vector<int>& nums, int goal) {
         int n = nums.size();
         int left1 = 0, left2 = 0, right = 0;
         int sum1 = 0, sum2 = 0;
         int ret = 0;
         while (right < n) {
             sum1 += nums[right];
             while (left1 <= right && sum1 > goal) {
                 sum1 -= nums[left1];
                 left1++;
             }
             sum2 += nums[right];
             while (left2 <= right && sum2 >= goal) {
                 sum2 -= nums[left2];
                 left2++;
             }
             ret += left2 - left1;
             right++;
         }
         return ret;
     }
 };
 */

class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
//        var preSums: [Int: Int] = [:], ans = 0, sum = 0
//        for num in nums {
//            preSums[sum] = preSums[sum, default: 0] + 1
//            sum += num
//            ans += preSums[sum - goal, default: 0]
//        }
//        return ans
        let n = nums.count
        var ans = 0, l1 = 0, l2 = 0, cnt1 = 0, cnt2 = 0
        for r in 0..<n {
            cnt1 += nums[r]
            while l1 <= r && cnt1 > goal {
                cnt1 -= nums[l1]
                l1 += 1
            }
            cnt2 += nums[r]
            while l2 <= r && cnt2 >= goal {
                cnt2 -= nums[l2]
                l2 += 1
            }
            ans += (l2 - l1)
        }
        return ans
    }
}

let nums = [1,0,1,0,1], goal = 2
let solution = Solution()
let ans = solution.numSubarraysWithSum(nums, goal)
ans

//: [Next](@next)
