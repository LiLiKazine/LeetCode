//: [Previous](@previous)

/*
 
 740. Delete and Earn
 
 Given an array nums of integers, you can perform operations on the array.

 In each operation, you pick any nums[i] and delete it to earn nums[i] points. After, you must delete every element equal to nums[i] - 1 or nums[i] + 1.

 You start with 0 points. Return the maximum number of points you can earn by applying such operations.

  

 Example 1:

 Input: nums = [3,4,2]
 Output: 6
 Explanation: Delete 4 to earn 4 points, consequently 3 is also deleted.
 Then, delete 2 to earn 2 points.
 6 total points are earned.
 Example 2:

 Input: nums = [2,2,3,3,3,4]
 Output: 9
 Explanation: Delete 3 to earn 3 points, deleting both 2's and the 4.
 Then, delete 3 again to earn 3 points, and 3 again to earn 3 points.
 9 total points are earned.
  

 Constraints:

 1 <= nums.length <= 2 * 10^4
 1 <= nums[i] <= 10^4
 
 */

/*
 
 class Solution {
 private:
     int rob(vector<int> &nums) {
         int size = nums.size();
         int first = nums[0], second = max(nums[0], nums[1]);
         for (int i = 2; i < size; i++) {
             int temp = second;
             second = max(first + nums[i], second);
             first = temp;
         }
         return second;
     }

 public:
     int deleteAndEarn(vector<int> &nums) {
         int maxVal = 0;
         for (int val : nums) {
             maxVal = max(maxVal, val);
         }
         vector<int> sum(maxVal + 1);
         for (int val : nums) {
             sum[val] += val;
         }
         return rob(sum);
     }
 };
 
 */

class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var arr: [Int] = Array(repeating: 0, count: 10001)
        for n in nums {
            arr[n] += n
        }
        var first = arr[0], second = max(arr[0], arr[1])
        for i in 2..<arr.count {
            let temp = second
            second = max(first + arr[i], second)
            first = temp
        }
        return second
    }
}

//: [Next](@next)
