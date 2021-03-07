//: [Previous](@previous)

/*
 
 131. Palindrome Partitioning
 
 Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

 A palindrome string is a string that reads the same backward as forward.

  

 Example 1:

 Input: s = "aab"
 Output: [["a","a","b"],["aa","b"]]
 Example 2:

 Input: s = "a"
 Output: [["a"]]
  

 Constraints:

 1 <= s.length <= 16
 s contains only lowercase English letters.
 
 */

class Solution {
    
    private var palindrome:[[Int]] = []
    private var temp: [String] = []
    private var ans: [[String]] = []
    private var characters: [Character] = []
    
    func partition(_ s: String) -> [[String]] {
        palindrome = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        characters = Array(s)
        dfs(0)
        return ans
    }
    
    private func dfs(_ i: Int) {
        if i == characters.count {
            ans.append(temp)
            return
        }
        for j in i..<characters.count {
            if isPalindrome(i, j) {
                temp.append(String(characters[i...j]))
                dfs(j + 1)
                temp.popLast()
            }
        }
    }
    
    private func isPalindrome(_ i: Int, _ j: Int) -> Bool {
        if palindrome[i][j] != 0 {
            return palindrome[i][j] > 0
        }
        if i >= j {
            palindrome[i][j] = 1
        } else {
            palindrome[i][j] = isPalindrome(i + 1, j - 1) && characters[i] == characters[j] ? 1 : -1
        }
        
        return palindrome[i][j] == 1
    }
}

//: [Next](@next)
