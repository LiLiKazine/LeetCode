//: [Previous](@previous)

/*
 
 680. Valid Palindrome II
 
 Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

 Example 1:
 Input: "aba"
 Output: True
 Example 2:
 Input: "abca"
 Output: True
 Explanation: You could delete the character 'c'.
 Note:
 The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
 
 */

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let s = Array(s),
            i = 0, j = s.count - 1
        return judge(s, i, j, chance: true)
    }
    
    func judge(_ s: [Character], _ i: Int, _ j: Int, chance: Bool) -> Bool {
        var i = i, j = j, flag = chance
        while i <= j {
            if s[i] == s[j] {
                i += 1
                j -= 1
            } else if flag && i + 1 <= j {
                flag = false
                if s[i+1] == s[j] || s[i] == s[j-1] {
                    return judge(s, i+1, j, chance: false) || judge(s, i, j-1, chance: false)
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return true
        
    }
}

let input =
"aguokepatgbnvfqmgmlcu puufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuup uculmgmqfvnbgtapekouga"
let solution = Solution()
let ans = solution.validPalindrome(input)

//: [Next](@next)
