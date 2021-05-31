//: [Previous](@previous)

/*
 
 421. Maximum XOR of Two Numbers in an Array
 
 Given an integer array nums, return the maximum result of nums[i] XOR nums[j], where 0 ≤ i ≤ j < n.

 Follow up: Could you do this in O(n) runtime?

  

 Example 1:

 Input: nums = [3,10,5,25,2,8]
 Output: 28
 Explanation: The maximum result is 5 XOR 25 = 28.
 Example 2:

 Input: nums = [0]
 Output: 0
 Example 3:

 Input: nums = [2,4]
 Output: 6
 Example 4:

 Input: nums = [8,10,2]
 Output: 10
 Example 5:

 Input: nums = [14,70,53,83,49,91,36,80,92,51,66,70]
 Output: 127
  

 Constraints:

 1 <= nums.length <= 2 * 104
 0 <= nums[i] <= 231 - 1
 
 */

class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var x = 0
        for k in stride(from: 30, to: -1, by: -1) {
            var seen: Set<Int> = Set()
            // 将所有的 pre^k(a_j) 放入哈希表中
            for num in nums {
                // 如果只想保留从最高位开始到第 k 个二进制位为止的部分
                // 只需将其右移 k 位
                seen.insert(num >> k);
            }

            // 目前 x 包含从最高位开始到第 k+1 个二进制位为止的部分
            // 我们将 x 的第 k 个二进制位置为 1，即为 x = x*2+1
            let x_next = x * 2 + 1;
            var found = false;

            // 枚举 i
            for num in nums {
                if (seen.contains(x_next ^ (num >> k))) {
                    found = true;
                    break;
                }
            }

            if (found) {
                x = x_next;
            }
            else {
                // 如果没有找到满足等式的 a_i 和 a_j，那么 x 的第 k 个二进制位只能为 0
                // 即为 x = x*2
                x = x_next - 1;
            }
        }
        return x
    }
}

//: [Next](@next)
