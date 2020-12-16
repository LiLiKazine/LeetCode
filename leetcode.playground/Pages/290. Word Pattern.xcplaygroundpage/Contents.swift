//: [Previous](@previous)

/*
 
 290. Word Pattern
 
 Given a pattern and a string s, find if s follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

  

 Example 1:

 Input: pattern = "abba", s = "dog cat cat dog"
 Output: true
 Example 2:

 Input: pattern = "abba", s = "dog cat cat fish"
 Output: false
 Example 3:

 Input: pattern = "aaaa", s = "dog cat cat dog"
 Output: false
 Example 4:

 Input: pattern = "abba", s = "dog dog dog dog"
 Output: false
  

 Constraints:

 1 <= pattern.length <= 300
 pattern contains only lower-case English letters.
 1 <= s.length <= 3000
 s contains only lower-case English letters and spaces ' '.
 s does not contain any leading or trailing spaces.
 All the words in s are separated by a single space.
 
 */
class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let components = s.split(separator: " ").map { String($0) }, pattern = Array(pattern)
        guard components.count == pattern.count else {
            return false
        }
        var table: [Character: String] = [:], table2: [String: Character] = [:]
        for i in 0..<components.count {
            let component = components[i], c = pattern[i]
            if table[c] == nil && table2[component] == nil {
                table[c] = component
                table2[component] = c
            }
            if table[c] != component {
                return false
            }
        }
        return true
    }
}

let pattern = "abba",
s = "dog dog dog dog"
let solution = Solution()
let ans = solution.wordPattern(pattern, s)
ans

//: [Next](@next)
