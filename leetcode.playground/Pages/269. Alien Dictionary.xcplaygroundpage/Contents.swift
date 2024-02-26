//: [Previous](@previous)

/*
 269. Alien Dictionary
 困难
 
 There is a new alien language that uses the English alphabet. However, the order of the letters is unknown to you.

 You are given a list of strings words from the alien language's dictionary. Now it is claimed that the strings in words are
 sorted lexicographically
  by the rules of this new language.

 If this claim is incorrect, and the given arrangement of string in words cannot correspond to any order of letters, return "".

 Otherwise, return a string of the unique letters in the new alien language sorted in lexicographically increasing order by the new language's rules. If there are multiple solutions, return any of them.

  

 Example 1:

 Input: words = ["wrt","wrf","er","ett","rftt"]
 Output: "wertf"
 Example 2:

 Input: words = ["z","x"]
 Output: "zx"
 Example 3:

 Input: words = ["z","x","z"]
 Output: ""
 Explanation: The order is invalid, so return "".
  

 Constraints:

 1 <= words.length <= 100
 1 <= words[i].length <= 100
 words[i] consists of only lowercase English letters.
 
 */

import Foundation

class Solution {
    
    let visiting = 1
    let visited = 2
    
    var map = [String: [String]]()
    var states = [String: Int]()
    
    var valid = true
    var ans = [String]()
    
    func alienOrder(_ words: [String]) -> String {
        for word in words {
            for c in word {
                map[String(c)] = []
            }
        }
        for i in 1..<words.count {
            let before = words[i-1], after = words[i]
            connect(before, after)
            guard valid else {
                return ""
            }
        }
        
        for key in map.keys {
            if states[key] == nil {
                dfs(key)
                guard valid else {
                    return ""
                }
            }
        }
        return ans.reduce("", +)
    }
    
    func connect(_ before: String, _ after: String) {
        let before = Array(before).map { String($0) }
        let after = Array(after).map { String($0) }
        let len = min(before.count, after.count)
        for i in 0..<len {
            let a = before[i], b = after[i]
            if a == b {
                continue
            }
            map[a] = map[a]! + [b]
            return
        }
        if before.count > after.count {
            valid = false
        }
    }
    
    func dfs(_ char: String) {
        let neighbour = map[char] ?? []
        states[char] = visiting
        for key in neighbour {
            if states[key] == nil {
                dfs(key)
            } else if states[key] == visiting {
                valid = false
                return
            }
        }
        states[char] = visited
        ans.insert(char, at: 0)
    }
    
}

//: [Next](@next)
