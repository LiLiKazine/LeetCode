//: [Previous](@previous)

/*
 
 402. Remove K Digits
 
 Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

 Note:
 The length of num is less than 10002 and will be ≥ k.
 The given num does not contain any leading zero.
 Example 1:

 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
 Example 2:

 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
 Example 3:

 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.
 
 */

/*
 
 class Solution {
     public String removeKdigits(String num, int k) {
         Deque<Character> deque = new LinkedList<Character>();
         int length = num.length();
         for (int i = 0; i < length; ++i) {
             char digit = num.charAt(i);
             while (!deque.isEmpty() && k > 0 && deque.peekLast() > digit) {
                 deque.pollLast();
                 k--;
             }
             deque.offerLast(digit);
         }
         
         for (int i = 0; i < k; ++i) {
             deque.pollLast();
         }
         
         StringBuilder ret = new StringBuilder();
         boolean leadingZero = true;
         while (!deque.isEmpty()) {
             char digit = deque.pollFirst();
             if (leadingZero && digit == '0') {
                 continue;
             }
             leadingZero = false;
             ret.append(digit);
         }
         return ret.length() == 0 ? "0" : ret.toString();
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/remove-k-digits/solution/yi-diao-kwei-shu-zi-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var dp: [[String]] = Array(repeating: Array(repeating: "0", count: k), count: num.count)
        for i in 1..<num.count {
            let pres = dp[i]
            for j in 1..<pres.count {
//                if j == pres.count - 1 {
//                    dp[i][j] = dp[i-1][j] + String(Array(num)[i])
//                    continue
//                }
                if i == num.count-1 {
                    dp[i][j] = dp[i-1][j] + String(Array(num)[i])
                    continue
                }
                let s1 = dp[i-1][j-1] + String(Array(num)[i+1])
                let s2 = dp[i-1][j] + String(Array(num)[i])
                dp[i][j] = String(min(Int(s1)!, Int(s2)!))
            }

        }
        dp
        print(dp)
        return dp[num.count-1][k-1]
    }
}

let num = "1432219", k = 3
let solution = Solution()
let ans = solution.removeKdigits(num, k)
ans


//: [Next](@next)
