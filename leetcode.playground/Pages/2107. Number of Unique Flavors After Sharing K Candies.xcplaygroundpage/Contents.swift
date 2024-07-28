//: [Previous](@previous)

/*
 2107. Number of Unique Flavors After Sharing K Candies
 中等
 You are given a 0-indexed integer array candies, where candies[i] represents the flavor of the ith candy. Your mom wants you to share these candies with your little sister by giving her k consecutive candies, but you want to keep as many flavors of candies as possible.

 Return the maximum number of unique flavors of candy you can keep after sharing with your sister.

  

 Example 1:

 Input: candies = [1,2,2,3,4,3], k = 3
 Output: 3
 Explanation:
 Give the candies in the range [1, 3] (inclusive) with flavors [2,2,3].
 You can eat candies with flavors [1,4,3].
 There are 3 unique flavors, so return 3.
 Example 2:

 Input: candies = [2,2,2,2,3,3], k = 2
 Output: 2
 Explanation:
 Give the candies in the range [3, 4] (inclusive) with flavors [2,3].
 You can eat candies with flavors [2,2,2,3].
 There are 2 unique flavors, so return 2.
 Note that you can also share the candies with flavors [2,2] and eat the candies with flavors [2,2,3,3].
 Example 3:

 Input: candies = [2,4,5], k = 0
 Output: 3
 Explanation:
 You do not have to give any candies.
 You can eat the candies with flavors [2,4,5].
 There are 3 unique flavors, so return 3.
  

 Constraints:

 1 <= candies.length <= 105
 1 <= candies[i] <= 105
 0 <= k <= candies.length
 */

/*
 class Solution {
     public int shareCandies(int[] candies, int k) {
         Map<Integer, Integer> counts = new HashMap<Integer, Integer>();
         int length = candies.length;
         for (int i = k; i < length; i++) {
             int candy = candies[i];
             counts.put(candy, counts.getOrDefault(candy, 0) + 1);
         }
         int maxFlavors = counts.size();
         for (int i = k; i < length; i++) {
             int prev = candies[i - k], curr = candies[i];
             counts.put(prev, counts.getOrDefault(prev, 0) + 1);
             counts.put(curr, counts.get(curr) - 1);
             if (counts.get(curr) == 0) {
                 counts.remove(curr);
             }
             maxFlavors = Math.max(maxFlavors, counts.size());
         }
         return maxFlavors;
     }
 }
 */

import Foundation

class Solution {
    func shareCandies(_ candies: [Int], _ k: Int) -> Int {
        let len = candies.count, m = len - k
        guard m > 0 else { return 0 }
        var cnt = [Int: Int](), ans = 0
        for i in k..<candies.count + m {
            let j = i % len
            let candy = candies[j]
            cnt[candy] = cnt[candy, default: 0] + 1
            if i >= k + m - 1 {
                ans = max(ans, cnt.count)
                let head = candies[(i - m + 1) % len]
                let val = cnt[head, default: 0] - 1
                if val == 0 {
                    cnt.removeValue(forKey: head)
                } else {
                    cnt[head] = val
                }
            }
        }
        return ans
    }
}


//: [Next](@next)
