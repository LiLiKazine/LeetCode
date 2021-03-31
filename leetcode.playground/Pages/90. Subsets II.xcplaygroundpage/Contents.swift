//: [Previous](@previous)

/*
 
 90. Subsets II
 
 Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,2]
 Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  

 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 
 */

/*
 
 class Solution {
 public:
     vector<int> t;
     vector<vector<int>> ans;

     void dfs(bool choosePre, int cur, vector<int> &nums) {
         if (cur == nums.size()) {
             ans.push_back(t);
             return;
         }
         dfs(false, cur + 1, nums);
         if (!choosePre && cur > 0 && nums[cur - 1] == nums[cur]) {
             return;
         }
         t.push_back(nums[cur]);
         dfs(true, cur + 1, nums);
         t.pop_back();
     }

     vector<vector<int>> subsetsWithDup(vector<int> &nums) {
         sort(nums.begin(), nums.end());
         dfs(false, 0, nums);
         return ans;
     }
 };
 
 */

class Solution {
    var temp: [Int] = []
    var ans: [[Int]] = []
    
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        recursive(choosePre: false, cur: 0, nums: nums.sorted())
        return ans
    }
    
    func recursive(choosePre: Bool, cur: Int, nums: [Int]) {
        if cur == nums.count {
            ans.append(temp)
            return
        }
        recursive(choosePre: false, cur: cur + 1, nums: nums)
        if !choosePre && cur > 0 && nums[cur - 1] == nums[cur] {
            return
        }
        temp.append(nums[cur])
        recursive(choosePre: true, cur: cur + 1, nums: nums)
        temp.popLast()
    }
}

//: [Next](@next)
