//: [Previous](@previous)

/*
 
 220. Contains Duplicate III
 
 Given an integer array nums and two integers k and t, return true if there are two distinct indices i and j in the array such that abs(nums[i] - nums[j]) <= t and abs(i - j) <= k.

  

 Example 1:

 Input: nums = [1,2,3,1], k = 3, t = 0
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1, t = 2
 Output: true
 Example 3:

 Input: nums = [1,5,9,1,5,9], k = 2, t = 3
 Output: false
  

 Constraints:

 0 <= nums.length <= 2 * 104
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 104
 0 <= t <= 231 - 1
 
 */

/*
 
 class Solution {
 public:
     int getID(int x, long w) {
         return x < 0 ? (x + 1ll) / w - 1 : x / w;
     }

     bool containsNearbyAlmostDuplicate(vector<int>& nums, int k, int t) {
         unordered_map<int, int> mp;
         int n = nums.size();
         for (int i = 0; i < n; i++) {
             long x = nums[i];
             int id = getID(x, t + 1ll);
             if (mp.count(id)) {
                 return true;
             }
             if (mp.count(id - 1) && abs(x - mp[id - 1]) <= t) {
                 return true;
             }
             if (mp.count(id + 1) && abs(x - mp[id + 1]) <= t) {
                 return true;
             }
             mp[id] = x;
             if (i >= k) {
                 mp.erase(getID(nums[i - k], t + 1ll));
             }
         }
         return false;
     }
 };
 
 */

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var dict: [Int: Int] = [:]
        for i in 0..<nums.count {
            let n = nums[i]
            let id = getID(n, t + 1)
            if dict[id] != nil {
                return true
            }
            if dict[id - 1] != nil && abs(x - dict[id - 1]) < t {
                return true
            }
            if dict {
                <#code#>
            }
        }
    }
    
    func getID(_ x: Int, _ w: Int) -> Int {
        if x >= 0 {
            return x / w;
        }
        return (x + 1) / w - 1;
    }
}

//: [Next](@next)
