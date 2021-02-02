//: [Previous](@previous)

/*
 
 424. Longest Repeating Character Replacement
 
 Given a string s that consists of only uppercase English letters, you can perform at most k operations on that string.

 In one operation, you can choose any character of the string and change it to any other uppercase English character.

 Find the length of the longest sub-string containing all repeating letters you can get after performing the above operations.

 Note:
 Both the string's length and k will not exceed 104.

 Example 1:

 Input:
 s = "ABAB", k = 2

 Output:
 4

 Explanation:
 Replace the two 'A's with two 'B's or vice versa.
  

 Example 2:

 Input:
 s = "AABABBA", k = 1

 Output:
 4

 Explanation:
 Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.
 
 */

class Solution {
    
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var s = Array(s).map { String($0) }, maxNum = 0, left = 0, right = 0, cache:[String: Int] = [:]
        while right < s.count {
            let c = s[right]
            cache[c] = (cache[c] ?? 0) + 1
            maxNum = max(maxNum, cache[c]!)
            if right - left + 1 - maxNum > k {
                cache[s[left]]! -= 1
                left += 1
            }
            right += 1
        }
        
        return right - left
    }
}

let s = "ABAA", k = 0
let solution = Solution()
let ans = solution.characterReplacement(s, k)
ans

//: [Next](@next)
