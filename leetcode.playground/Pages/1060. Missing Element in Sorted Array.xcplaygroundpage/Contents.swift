//: [Previous](@previous)

/*
 1060. Missing Element in Sorted Array
 中等
 Given an integer array nums which is sorted in ascending order and all of its elements are unique and given also an integer k, return the kth missing number starting from the leftmost number of the array.

  

 Example 1:

 Input: nums = [4,7,9,10], k = 1
 Output: 5
 Explanation: The first missing number is 5.
 Example 2:

 Input: nums = [4,7,9,10], k = 3
 Output: 8
 Explanation: The missing numbers are [5,6,8,...], hence the third missing number is 8.
 Example 3:

 Input: nums = [1,2,4], k = 3
 Output: 6
 Explanation: The missing numbers are [3,5,6,7,...], hence the third missing number is 6.
  

 Constraints:

 1 <= nums.length <= 5 * 104
 1 <= nums[i] <= 107
 nums is sorted in ascending order, and all the elements are unique.
 1 <= k <= 108
  

 Follow up: Can you find a logarithmic time complexity (i.e., O(log(n))) solution?
 
 */

import Foundation

class Solution {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        let cnt = nums.count
        if missingCnt(till: cnt - 1, nums: nums) < k {
            return nums[cnt - 1] + k - missingCnt(till: cnt - 1, nums: nums)
        }
        var lo = 0, hi = cnt - 1
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if missingCnt(till: mid, nums: nums) < k {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return nums[lo - 1] + k - missingCnt(till: lo - 1, nums: nums)
    }
    
    func missingCnt(till index: Int, nums: [Int]) -> Int {
        return nums[index] - nums[0] - index
    }
}

/*
 class Solution {
   // Return how many numbers are missing until nums[idx]
   int missing(int idx, int[] nums) {
       return nums[idx] - nums[0] - idx;
   }

   public int missingElement(int[] nums, int k) {
       int n = nums.length;
       // If kth missing number is larger than
       // the last element of the array
       if (k > missing(n - 1, nums))
           return nums[n - 1] + k - missing(n - 1, nums);

       int left = 0, right = n - 1, pivot;
       // find left = right index such that
       // missing(left - 1) < k <= missing(left)
       while (left != right) {
           pivot = left + (right - left) / 2;

           if (missing(pivot, nums) < k) left = pivot + 1;
           else right = pivot;
       }

       // kth missing number is larger than nums[idx - 1]
       // and smaller than nums[idx]
       return nums[left - 1] + k - missing(left - 1, nums);
   }
 }
 */

//: [Next](@next)
