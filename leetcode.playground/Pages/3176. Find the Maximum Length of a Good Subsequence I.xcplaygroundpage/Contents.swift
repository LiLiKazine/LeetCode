//: [Previous](@previous)

/*
 3176. Find the Maximum Length of a Good Subsequence I
 中等
 You are given an integer array nums and a non-negative integer k. A sequence of integers seq is called good if there are at most k indices i in the range [0, seq.length - 2] such that seq[i] != seq[i + 1].

 Return the maximum possible length of a good
 subsequence
  of nums.

  

 Example 1:

 Input: nums = [1,2,1,1,3], k = 2

 Output: 4

 Explanation:

 The maximum length subsequence is [1,2,1,1,3].

 Example 2:

 Input: nums = [1,2,3,4,5,1], k = 0

 Output: 2

 Explanation:

 The maximum length subsequence is [1,2,3,4,5,1].

  

 Constraints:

 1 <= nums.length <= 500
 1 <= nums[i] <= 109
 0 <= k <= min(nums.length, 25)
 */

import Foundation

class Solution {
    
    func maximumLength(_ nums: [Int], _ k: Int) -> Int {
        var fs = [Int: [Int]]()
        var records = Array(repeating: [0, 0, 0], count: k + 1)
        for x in nums {
            var f = fs[x, default: Array(repeating: 0, count: k + 1)]
            for j in stride(from: k, through: 0, by: -1) {
                f[j] += 1
                if j > 0 {
                    let mx = records[j-1][0], mx2 = records[j-1][1], num = records[j-1][2]
                    f[j] = max(f[j], (x != num ? mx : mx2) + 1)
                }
                let v = f[j]
                var p = records[j]
                if v > p[0] {
                    if (x != p[2]) {
                        p[2] = x
                        p[1] = p[0]
                    }
                    p[0] = v
                } else if x != p[2] && v > p[1] {
                    p[1] = v
                }
                records[j] = p
            }
            fs[x] = f
        }
        return records[k][0]
    }
}
 
/*
 class Solution {
     public int maximumLength(int[] nums, int k) {
         Map<Integer, int[]> fs = new HashMap<>();
         int[][] records = new int[k + 1][3];
         for (int x : nums) {
             int[] f = fs.computeIfAbsent(x, i -> new int[k + 1]);
             for (int j = k; j >= 0; j--) {
                 f[j]++;
                 if (j > 0) {
                     int mx = records[j - 1][0], mx2 = records[j - 1][1], num = records[j - 1][2];
                     f[j] = Math.max(f[j], (x != num ? mx : mx2) + 1);
                 }

                 // records[j] 维护 fs[.][j] 的 mx, mx2, num
                 int v = f[j];
                 int[] p = records[j];
                 if (v > p[0]) {
                     if (x != p[2]) {
                         p[2] = x;
                         p[1] = p[0];
                     }
                     p[0] = v;
                 } else if (x != p[2] && v > p[1]) {
                     p[1] = v;
                 }
             }
         }
         return records[k][0];
     }
 }
 */

//: [Next](@next)
