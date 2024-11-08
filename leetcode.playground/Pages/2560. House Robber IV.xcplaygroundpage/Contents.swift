//: [Previous](@previous)

/*
 2560. House Robber IV
 中等
 There are several consecutive houses along a street, each of which has some money inside. There is also a robber, who wants to steal money from the homes, but he refuses to steal from adjacent homes.

 The capability of the robber is the maximum amount of money he steals from one house of all the houses he robbed.

 You are given an integer array nums representing how much money is stashed in each house. More formally, the ith house from the left has nums[i] dollars.

 You are also given an integer k, representing the minimum number of houses the robber will steal from. It is always possible to steal at least k houses.

 Return the minimum capability of the robber out of all the possible ways to steal at least k houses.

  

 Example 1:

 Input: nums = [2,3,5,9], k = 2
 Output: 5
 Explanation:
 There are three ways to rob at least 2 houses:
 - Rob the houses at indices 0 and 2. Capability is max(nums[0], nums[2]) = 5.
 - Rob the houses at indices 0 and 3. Capability is max(nums[0], nums[3]) = 9.
 - Rob the houses at indices 1 and 3. Capability is max(nums[1], nums[3]) = 9.
 Therefore, we return min(5, 9, 9) = 5.
 Example 2:

 Input: nums = [2,7,9,3,1], k = 2
 Output: 2
 Explanation: There are 7 ways to rob the houses. The way which leads to minimum capability is to rob the house at index 0 and 4. Return max(nums[0], nums[4]) = 2.
  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 109
 1 <= k <= (nums.length + 1)/2
 */
/*
 class Solution {
     public int minCapability(int[] nums, int k) {
         int left = 0, right = 0;
         for (int x : nums) {
             right = Math.max(right, x);
         }
         while (left + 1 < right) { // 开区间写法
             int mid = (left + right) >>> 1;
             if (check(nums, k, mid)) {
                 right = mid;
             } else {
                 left = mid;
             }
         }
         return right;
     }

     private boolean check(int[] nums, int k, int mx) {
         int f0 = 0, f1 = 0;
         for (int x : nums) {
             if (x > mx) {
                 f0 = f1;
             } else {
                 int tmp = f1;
                 f1 = Math.max(f1, f0 + 1);
                 f0 = tmp;
             }
         }
         return f1 >= k;
     }
 }
 */
import Foundation

class Solution {
    
    func minCapability(_ nums: [Int], _ k: Int) -> Int {
        
        func check(_ x: Int) -> Bool {
            var f0 = 0, f1 = 0
            for n in nums {
                if n > x {
                    f0 = f1
                } else {
                    var tmp = f1
                    f1 = max(f0 + 1, f1)
                    f0 = tmp
                }
            }
            return f1 >= k
        }
        
        var l = nums.min()!, r = nums.max()!
        while l <= r {
            let x = l + (r - l) / 2
            if check(x) {
                r = x - 1
            } else {
                l = x + 1
            }
        }
        return l
    }
}

//: [Next](@next)
