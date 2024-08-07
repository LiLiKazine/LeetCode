//: [Previous](@previous)

/*
 
 395. Longest Substring with At Least K Repeating Characters

 Given a string s and an integer k, return the length of the longest substring of s such that the frequency of each character in this substring is greater than or equal to k.

  

 Example 1:

 Input: s = "aaabb", k = 3
 Output: 3
 Explanation: The longest substring is "aaa", as 'a' is repeated 3 times.
 Example 2:

 Input: s = "ababbc", k = 2
 Output: 5
 Explanation: The longest substring is "ababb", as 'a' is repeated 2 times and 'b' is repeated 3 times.
  

 Constraints:

 1 <= s.length <= 104
 s consists of only lowercase English letters.
 1 <= k <= 105
 
 */

class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        
        var s = Array(s).map { String($0) }
        var ans = 0
        
        for t in 1...26 {
            var cnt = [String: Int](), left = 0, sum = 0, tot = 0
            for right in 0..<s.count {
                let char = s[right]
                let val = cnt[char, default: 0] + 1
                cnt[char] = val
                if val == 1 {
                    sum += 1
                }
                if val == k {
                    tot += 1
                }
                while sum > t && left < right {
                    let char = s[left]
                    left += 1
                    let val = cnt[char, default: 0] - 1
                    cnt[char] = val
                    if val == 0 {
                        sum -= 1
                    }
                    if val == k - 1 {
                        tot -= 1
                    }
                }
                if sum == tot {
                    ans = max(ans, right - left + 1)
                }
            }
        }
        
        return ans
    }
    
}


let s = "aaabb", k = 3
let solution = Solution()
let ans = solution.longestSubstring(s, k)
ans

//: [Next](@next)
