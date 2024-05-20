//: [Previous](@previous)

/*
 1542. Find Longest Awesome Substring
 困难
 You are given a string s. An awesome substring is a non-empty substring of s such that we can make any number of swaps in order to make it a palindrome.

 Return the length of the maximum length awesome substring of s.

  

 Example 1:

 Input: s = "3242415"
 Output: 5
 Explanation: "24241" is the longest awesome substring, we can form the palindrome "24142" with some swaps.
 Example 2:

 Input: s = "12345678"
 Output: 1
 Example 3:

 Input: s = "213123"
 Output: 6
 Explanation: "213123" is the longest awesome substring, we can form the palindrome "231132" with some swaps.
  

 Constraints:

 1 <= s.length <= 105
 s consists only of digits.
 
 */

import Foundation

class Solution {
    func longestAwesome(_ s: String) -> Int {
        let s = Array(s)
        var prefix = [0: -1], seq = 0, ans = 0
        for j in 0..<s.count {
            let c = s[j]
            let digit = Int(String(c))!
            seq = seq ^ (1 << digit)
            if let i = prefix[seq] {
                ans = max(ans, j - i)
            } else {
                prefix[seq] = j
            }
            for k in 0..<10 {
                let _seq = seq ^ (1 << k)
                if let i = prefix[_seq] {
                    ans = max(ans,  j - i)
                }
            }
        }
        return ans
    }
    
    private func backtrace(_ s: String) -> Int {
        if s.count < 2 { return s.count }
        
        var s = Array(s)
        
        var cnt = [Character: Int]()
        for c in s {
            if cnt[c] == nil {
                cnt[c] = 1
            } else {
                cnt[c] = cnt[c]! + 1
            }
        }
        return backtrace(s, lo: 0, hi: s.count - 1, cnt: &cnt)
    }
    
    private func backtrace(_ s: [Character], lo: Int, hi: Int, cnt: inout [Character: Int]) -> Int {
        guard lo < hi else { return 1 }
        if isPalindrome(cnt.values) {
            return hi - lo + 1
        }
        var ans = 0
        let loC = s[lo]
        cnt[loC] = cnt[loC]! - 1
        ans = backtrace(s, lo: lo + 1, hi: hi, cnt: &cnt)
        cnt[loC] = cnt[loC]! + 1
        
        let hiC = s[hi]
        cnt[hiC] = cnt[hiC]! - 1
        ans = max(ans, backtrace(s, lo: lo, hi: hi - 1, cnt: &cnt))
        cnt[hiC] = cnt[hiC]! + 1
        return ans
    }
    
    private func isPalindrome(_ values: Dictionary<Character, Int>.Values) -> Bool {
        var hasOdd = false
        for val in values {
            if val % 2 == 0 { continue }
            if hasOdd { return false }
            hasOdd = true
        }
        return true
    }
    
    
    private func brutal(_ s: String) -> Int {
        if s.count < 2 { return s.count }
        var s = Array(s)
        
        var lo = 0, hi = s.count - 1
        
        return longestAwesome(s, from: lo, through: hi)
    }
    
    private func longestAwesome(_ s: [Character], from :Int, through: Int) -> Int {
        guard through > from else {
            return 1
        }
        if isPalindrome(s, from: from, through: through) {
            return through - from + 1
        }
        return max(longestAwesome(s, from: from + 1, through: through), longestAwesome(s, from: from, through: through - 1))
    }
    
    private func isPalindrome(_ s: [Character], from :Int, through: Int) -> Bool {
        var set = Set<Character>()
        for i in from...through {
            let c = s[i]
            if set.contains(c) {
                set.remove(c)
            } else {
                set.insert(c)
            }
        }
        return set.count < 2
    }
}

//: [Next](@next)
