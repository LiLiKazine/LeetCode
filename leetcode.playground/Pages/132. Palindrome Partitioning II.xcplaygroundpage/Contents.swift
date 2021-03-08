//: [Previous](@previous)

/*
 
 132. Palindrome Partitioning II
 
 Given a string s, partition s such that every substring of the partition is a palindrome.

 Return the minimum cuts needed for a palindrome partitioning of s.

  

 Example 1:

 Input: s = "aab"
 Output: 1
 Explanation: The palindrome partitioning ["aa","b"] could be produced using 1 cut.
 Example 2:

 Input: s = "a"
 Output: 0
 Example 3:

 Input: s = "ab"
 Output: 1
  

 Constraints:

 1 <= s.length <= 2000
 s consists of lower-case English letters only.
 
 */

/*
 
 class Solution {
 public:
     int minCut(string s) {
         int n = s.size();
         vector<vector<int>> g(n, vector<int>(n, true));

         for (int i = n - 1; i >= 0; --i) {
             for (int j = i + 1; j < n; ++j) {
                 g[i][j] = (s[i] == s[j]) && g[i + 1][j - 1];
             }
         }

         vector<int> f(n, INT_MAX);
         for (int i = 0; i < n; ++i) {
             if (g[0][i]) {
                 f[i] = 0;
             }
             else {
                 for (int j = 0; j < i; ++j) {
                     if (g[j + 1][i]) {
                         f[i] = min(f[i], f[j] + 1);
                     }
                 }
             }
         }

         return f[n - 1];
     }
 };


 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/palindrome-partitioning-ii/solution/fen-ge-hui-wen-chuan-ii-by-leetcode-solu-norx/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    
    func minCut(_ s: String) -> Int {
        let characters = Array(s)
        var palindrome = Array(repeating: Array(repeating: true, count: s.count), count: s.count),
        dp = Array(repeating: Int.max, count: s.count)
        
        for i in stride(from: s.count-1, to: -1, by: -1) {
            for j in i + 1..<s.count {
                palindrome[i][j] = (characters[i] == characters[j] && palindrome[i + 1][j - 1]) || i >= j
            }
        }
        
        for k in 0..<characters.count {
            if palindrome[0][k] {
                dp[k] = 0
            } else {
                for t in 0..<k {
                    if palindrome[t + 1][k] {
                        dp[k] = min(dp[k], dp[t] + 1)
                    }
                }
            }
            
        }
        return dp.last!
    }
}

//: [Next](@next)
