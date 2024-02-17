//: [Previous](@previous)

/*
 616. Add Bold Tag in String
 
 You are given a string s and an array of strings words.

 You should add a closed pair of bold tag <b> and </b> to wrap the substrings in s that exist in words.

 If two such substrings overlap, you should wrap them together with only one pair of closed bold-tag.
 If two substrings wrapped by bold tags are consecutive, you should combine them.
 Return s after adding the bold tags.

  

 Example 1:

 Input: s = "abcxyz123", words = ["abc","123"]
 Output: "<b>abc</b>xyz<b>123</b>"
 Explanation: The two strings of words are substrings of s as following: "abcxyz123".
 We add <b> before each substring and </b> after each substring.
 Example 2:

 Input: s = "aaabbb", words = ["aa","b"]
 Output: "<b>aaabbb</b>"
 Explanation:
 "aa" appears as a substring two times: "aaabbb" and "aaabbb".
 "b" appears as a substring three times: "aaabbb", "aaabbb", and "aaabbb".
 We add <b> before each substring and </b> after each substring: "<b>a<b>a</b>a</b><b>b</b><b>b</b><b>b</b>".
 Since the first two <b>'s overlap, we merge them: "<b>aaa</b><b>b</b><b>b</b><b>b</b>".
 Since now the four <b>'s are consecutive, we merge them: "<b>aaabbb</b>".
  

 Constraints:

 1 <= s.length <= 1000
 0 <= words.length <= 100
 1 <= words[i].length <= 1000
 s and words[i] consist of English letters and digits.
 All the values of words are unique.
  

 Note: This question is the same as 758: https://leetcode.com/problems/bold-words-in-string/

 */

import Foundation

class Solution {
    func addBoldTag(_ s: String, _ words: [String]) -> String {
        
        var masks = Array(repeating: false, count: s.count)
        let s = Array(s)
        for i in 0..<s.count {
            for word in words {
                let sub = String(s[i...])
                if sub.hasPrefix(word) {
                    for j in 0..<word.count {
                        masks[i+j] = true
                    }
                }
            }
        }
        
        var ans = ""
        
        for i in 0..<masks.count {
            if masks[i] && (i == 0 || !masks[i-1]) {
                ans.append("<b>")
            }
            ans.append(String(s[i]))
            if masks[i] && (i == masks.count - 1 || !masks[i+1]) {
                ans.append("</b>")
            }
            
        }
        return ans
    }
}

//: [Next](@next)
