//: [Previous](@previous)

/*
 
 523. Continuous Subarray Sum
 
 Given a list of non-negative numbers and a target integer k, write a function to check if the array has a continuous subarray of size at least 2 that sums up to a multiple of k, that is, sums up to n*k where n is also an integer.

  

 Example 1:

 Input: [23, 2, 4, 6, 7],  k=6
 Output: True
 Explanation: Because [2, 4] is a continuous subarray of size 2 and sums up to 6.
 Example 2:

 Input: [23, 2, 6, 4, 7],  k=6
 Output: True
 Explanation: Because [23, 2, 6, 4, 7] is an continuous subarray of size 5 and sums up to 42.
  

 Constraints:

 The length of the array won't exceed 10,000.
 You may assume the sum of all the numbers is in the range of a signed 32-bit integer.
 
 */

/*
 
 class Solution {
     public boolean checkSubarraySum(int[] nums, int k) {
         int m = nums.length;
         if (m < 2) {
             return false;
         }
         Map<Integer, Integer> map = new HashMap<Integer, Integer>();
         map.put(0, -1);
         int remainder = 0;
         for (int i = 0; i < m; i++) {
             remainder = (remainder + nums[i]) % k;
             if (map.containsKey(remainder)) {
                 int prevIndex = map.get(remainder);
                 if (i - prevIndex >= 2) {
                     return true;
                 }
             } else {
                 map.put(remainder, i);
             }
         }
         return false;
     }
 }
 
 */

class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        let m = nums.count
        if m < 2 {
            return false
        }
        var map: [Int: Int] = [0: -1], remainder = 0
        for i in 0..<m {
            remainder = (remainder + nums[i]) % k
            if map[remainder] == nil {
                map[remainder] = i
            } else {
                let prevIndex = map[remainder]!
                if i - prevIndex >= 2 {
                    return true
                }
            }
        }
        return false
    }
    
    func recursive(_ nums: [Int], _ k: Int, _ arr: [Int], _ i: Int) -> Bool {
        if arr.count >= 2 && k != 0 && arr.reduce(0, +) % k == 0 {
            return true
        }
        if arr.count >= 2 && k == 0 && arr.reduce(0, +) == 0 {
            return true
        }
        if i >= nums.count {
            return false
        }
        return recursive(nums, k, arr + [nums[i]], i + 1) || recursive(nums, k, [], i + 1)
    }
}

let sums = [0,0],  k = 0
let solution = Solution()
let ans = solution.checkSubarraySum(sums, k)
ans

//: [Next](@next)
