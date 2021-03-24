//: [Previous](@previous)

/*
 
 456. 132 Pattern
 
 Given an array of n integers nums, a 132 pattern is a subsequence of three integers nums[i], nums[j] and nums[k] such that i < j < k and nums[i] < nums[k] < nums[j].

 Return true if there is a 132 pattern in nums, otherwise, return false.

 Follow up: The O(n^2) is trivial, could you come up with the O(n logn) or the O(n) solution?

  

 Example 1:

 Input: nums = [1,2,3,4]
 Output: false
 Explanation: There is no 132 pattern in the sequence.
 Example 2:

 Input: nums = [3,1,4,2]
 Output: true
 Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
 Example 3:

 Input: nums = [-1,3,2,0]
 Output: true
 Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].
  

 Constraints:

 n == nums.length
 1 <= n <= 104
 -109 <= nums[i] <= 109
 
 */

/*
 
 class Solution {
 public:
     bool find132pattern(vector<int>& nums) {
         int n = nums.size();
         stack<int> candidate_k;
         candidate_k.push(nums[n - 1]);
         int max_k = INT_MIN;

         for (int i = n - 2; i >= 0; --i) {
             if (nums[i] < max_k) {
                 return true;
             }
             while (!candidate_k.empty() && nums[i] > candidate_k.top()) {
                 max_k = candidate_k.top();
                 candidate_k.pop();
             }
             if (nums[i] > max_k) {
                 candidate_k.push(nums[i]);
             }
         }

         return false;
     }
 };
 
 */

class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else {
            return false
        }
        var monotone: [Int] = [nums.last!], max_k = Int.min
        for i in stride(from: nums.count - 2, to: -1, by: -1) {
            if nums[i] < max_k {
                return true
            }
            while !monotone.isEmpty && nums[i] > monotone.last! {
                max_k = monotone.removeLast()
            }
            
            if nums[i] > max_k {
                monotone.append(nums[i])
            }
        }
        
        return false
    }
}

//: [Next](@next)
