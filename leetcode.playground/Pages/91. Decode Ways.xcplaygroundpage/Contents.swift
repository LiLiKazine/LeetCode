//: [Previous](@previous)

/*
 
 91. Decode Ways
 
 A message containing letters from A-Z can be encoded into numbers using the following mapping:

 'A' -> "1"
 'B' -> "2"
 ...
 'Z' -> "26"
 To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, "11106" can be mapped into:

 "AAJF" with the grouping (1 1 10 6)
 "KJF" with the grouping (11 10 6)
 Note that the grouping (1 11 06) is invalid because "06" cannot be mapped into 'F' since "6" is different from "06".

 Given a string s containing only digits, return the number of ways to decode it.

 The answer is guaranteed to fit in a 32-bit integer.

  

 Example 1:

 Input: s = "12"
 Output: 2
 Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).
 Example 2:

 Input: s = "226"
 Output: 3
 Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 Example 3:

 Input: s = "0"
 Output: 0
 Explanation: There is no character that is mapped to a number starting with 0.
 The only valid mappings with 0 are 'J' -> "10" and 'T' -> "20", neither of which start with 0.
 Hence, there are no valid ways to decode this since all digits need to be mapped.
 Example 4:

 Input: s = "06"
 Output: 0
 Explanation: "06" cannot be mapped to "F" because of the leading zero ("6" is different from "06").
  

 Constraints:

 1 <= s.length <= 100
 s contains only digits and may contain leading zero(s).
 
 */

/*
 
 class Solution {
 public:
     int numDecodings(string s) {
         int n = s.size();
         vector<int> f(n + 1);
         f[0] = 1;
         for (int i = 1; i <= n; ++i) {
             if (s[i - 1] != '0') {
                 f[i] += f[i - 1];
             }
             if (i > 1 && s[i - 2] != '0' && ((s[i - 2] - '0') * 10 + (s[i - 1] - '0') <= 26)) {
                 f[i] += f[i - 2];
             }
         }
         return f[n];
     }
 };
 
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        
        var dp: [Int] = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        for i in 1...s.count {
            if s.str(at: i - 1) != "0" {
                dp[i] += dp[i - 1]
            }
            if i > 1 && s.str(at: i - 2) != "0" {
                if let str = s.subStr(from: i - 2, to: i - 1),
                   let val = Int(str), val <= 26 {
                    dp[i] += dp[i - 2]
                }
            }
        }
        
        return dp[s.count]
    }
    /*
    func numDecodings(_ s: String) -> Int {
        
        let ans = nums(s, 0)
        
        return ans
    }
    
    private func nums(_ s: String, _ i: Int) -> Int {
        if i == s.count {
            return 1
        }
        let start = s.str(at: i)
        guard let val = Int(start), val > 0, val <= 26 else {
            return 0
        }
        let n = nums(s, i + 1)
        
        guard let start1 = s.subStr(from: i, to: i + 1), let val2 = Int(start1), val2 > 0, val2 <= 26 else {
            return n
        }
        let m = nums(s, i + 2)
        return n + m
    }
 */
    
}

extension String {
    func str(at index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    func subStr(from begin: Int, to end: Int) -> String? {
        if end >= self.count {
            return nil
        }
        return String(self[self.index(self.startIndex, offsetBy: begin)...self.index(self.startIndex, offsetBy: end)])
    }
}

let s = "12"
let solution = Solution()
let ans = solution.numDecodings(s)
ans

//: [Next](@next)
