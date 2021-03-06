//: [Previous](@previous)

/*
 
 503. Next Greater Element II
 
 Given a circular array (the next element of the last element is the first element of the array), print the Next Greater Number for every element. The Next Greater Number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, output -1 for this number.

 Example 1:
 Input: [1,2,1]
 Output: [2,-1,2]
 Explanation: The first 1's next greater number is 2;
 The number 2 can't find next greater number;
 The second 1's next greater number needs to search circularly, which is also 2.
 Note: The length of given array won't exceed 10000.
 
 */

/*
 
 class Solution {
 public:
     vector<int> nextGreaterElements(vector<int>& nums) {
         int n = nums.size();
         vector<int> ret(n, -1);
         stack<int> stk;
         for (int i = 0; i < n * 2 - 1; i++) {
             while (!stk.empty() && nums[stk.top()] < nums[i % n]) {
                 ret[stk.top()] = nums[i % n];
                 stk.pop();
             }
             stk.push(i % n);
         }
         return ret;
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/next-greater-element-ii/solution/xia-yi-ge-geng-da-yuan-su-ii-by-leetcode-bwam/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return []
        }
        var monotone: [Int] = [], ans: [Int] = Array(repeating: -1, count: nums.count)
        for i in 0..<nums.count * 2 - 1 {
            while !monotone.isEmpty && nums[monotone.last!] < nums[i % nums.count] {
                ans[monotone.popLast()!] = nums[i % nums.count]
            }
            monotone.append(i % nums.count)
        }
        return ans
    }
}

//: [Next](@next)
