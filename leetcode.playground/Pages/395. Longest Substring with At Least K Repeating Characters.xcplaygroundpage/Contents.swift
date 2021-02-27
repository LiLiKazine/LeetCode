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
        
        return dfs(Array(s), k)
    }
    
    private func dfs(_ s: [Character], _ k: Int) -> Int {
        var cnt: [Int] = Array(repeating: 0, count: 26), ans = 0
        for c in s {
            cnt[c.index] += 1
        }
        
        var c: Character? = nil
        
        for i in 0..<cnt.count {
            let n = cnt[i]
            if n != 0 && n < k {
                c = i.characte
                break
            }
        }
        guard let split = c else {
            return s.count
        }
        
        let components = s.split(separator: split).map { Array($0) }
        for component in components {
            ans = max(ans, dfs(component, k))
        }
        return ans
    }
}

fileprivate extension Character {
    
    var index: Int {
        Int(self.asciiValue! - Character("a").asciiValue!)
    }
}

fileprivate extension Int {
    var characte: Character {
        Character(.init(Character("a").asciiValue! + UInt8(self)))
    }
}

let s = "aaabb", k = 3
let solution = Solution()
let ans = solution.longestSubstring(s, k)
ans

//: [Next](@next)
