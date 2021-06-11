//: [Previous](@previous)

/*
 
 279. Perfect Squares
 
 Given an integer n, return the least number of perfect square numbers that sum to n.

 A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

  

 Example 1:

 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 Example 2:

 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
  

 Constraints:

 1 <= n <= 104
 
 */

/*
 
 class Solution {
 public:
     int numSquares(int n) {
         vector<int> f(n + 1);
         for (int i = 1; i <= n; i++) {
             int minn = INT_MAX;
             for (int j = 1; j * j <= i; j++) {
                 minn = min(minn, f[i - j * j]);
             }
             f[i] = minn + 1;
         }
         return f[n];
     }
 };
 
 */

class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            var minn = Int.max, j = 1
            while j * j <= i {
                minn = min(minn, dp[i - j * j])
                j += 1
            }
            dp[i] = minn + 1
        }
        return dp[n]
    }
}

let n = 12
let solution = Solution()
let ans = solution.numSquares(n)
ans

//: [Next](@next)
