//: [Previous](@previous)

/*
 
 387. First Unique Character in a String
 
 Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

 Examples:

 s = "leetcode"
 return 0.

 s = "loveleetcode"
 return 2.
  

 Note: You may assume the string contains only lowercase English letters.
 
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var cache:[Character: Int] = [:], s = Array(s)
        for i in 0..<s.count {
            let c = s[i]
            cache[c] = (cache[c] ?? 0) + 1
        }
        for i in 0..<s.count {
            let c = s[i]
            if cache[c]! == 1 {
                return i
            }
        }
        
        return -1
    }
    
    func overflowed(_ s: String) -> Int {
        var cache:[Character: [Int]] = [:], ans = s.count
        for i in 0..<s.count {
            let c = Array(s)[i]
            cache[c] = (cache[c] ?? []) + [i]
        }
        for vals in cache.values {
            if vals.count > 1 {
                continue
            }
            ans = min(ans, vals.first!)
        }
        
        return ans == s.count ? -1 : ans
    }
}


let solution = Solution()
let ans = solution.firstUniqChar("leetcode")
ans

//: [Next](@next)
