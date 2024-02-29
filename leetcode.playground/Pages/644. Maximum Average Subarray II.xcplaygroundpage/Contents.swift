//: [Previous](@previous)

/*
 644. Maximum Average Subarray II
 困难
 You are given an integer array nums consisting of n elements, and an integer k.

 Find a contiguous subarray whose length is greater than or equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

  

 Example 1:

 Input: nums = [1,12,-5,-6,50,3], k = 4
 Output: 12.75000
 Explanation:
 - When the length is 4, averages are [0.5, 12.75, 10.5] and the maximum average is 12.75
 - When the length is 5, averages are [10.4, 10.8] and the maximum average is 10.8
 - When the length is 6, averages are [9.16667] and the maximum average is 9.16667
 The maximum average is when we choose a subarray of length 4 (i.e., the sub array [12, -5, -6, 50]) which has the max average 12.75, so we return 12.75
 Note that we do not consider the subarrays of length < 4.
 Example 2:

 Input: nums = [5], k = 1
 Output: 5.00000
  

 Constraints:

 n == nums.length
 1 <= k <= n <= 104
 -104 <= nums[i] <= 104
 
 */

import Foundation

class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {

    }
}

/*
 public class Solution {
     public double findMaxAverage(int[] nums, int k) {
         double max_val = Integer.MIN_VALUE;
         double min_val = Integer.MAX_VALUE;
         for (int n: nums) {
             max_val = Math.max(max_val, n);
             min_val = Math.min(min_val, n);
         }
         double prev_mid = max_val, error = Integer.MAX_VALUE;
         while (error > 0.00001) {
             double mid = (max_val + min_val) * 0.5;
             if (check(nums, mid, k))
                 min_val = mid;
             else
                 max_val = mid;
             error = Math.abs(prev_mid - mid);
             prev_mid = mid;
         }
         return min_val;
     }
     public boolean check(int[] nums, double mid, int k) {
         double sum = 0, prev = 0, min_sum = 0;
         for (int i = 0; i < k; i++)
             sum += nums[i] - mid;
         if (sum >= 0)
             return true;
         for (int i = k; i < nums.length; i++) {
             sum += nums[i] - mid;
             prev += nums[i - k] - mid;
             min_sum = Math.min(prev, min_sum);
             if (sum >= min_sum)
                 return true;
         }
         return false;
     }
 }

 作者：LeetCode
 链接：https://leetcode.cn/problems/maximum-average-subarray-ii/solutions/60426/zui-da-ping-jun-zi-duan-he-ii-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

//: [Next](@next)
