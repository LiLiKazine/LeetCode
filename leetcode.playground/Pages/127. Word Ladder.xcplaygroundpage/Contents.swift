//: [Previous](@previous)

/*
 127. Word Ladder
 困难
 A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

 Every adjacent pair of words differs by a single letter.
 Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
 sk == endWord
 Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

  

 Example 1:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
 Output: 5
 Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
 Example 2:

 Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
 Output: 0
 Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
  

 Constraints:

 1 <= beginWord.length <= 10
 endWord.length == beginWord.length
 1 <= wordList.length <= 5000
 wordList[i].length == beginWord.length
 beginWord, endWord, and wordList[i] consist of lowercase English letters.
 beginWord != endWord
 All the words in wordList are unique.
 
 */

import Foundation

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordMap = [String: Int]()
        for (i, word) in wordList.enumerated() {
            wordMap[word] = i
        }
        if wordMap[endWord] == nil {
            return 0
        }
        let characters = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
        var q = [beginWord], ans = 0
        var visited = Array(repeating: false, count: wordList.count)
        while q.count > 0 {
            var nexts = [String]()
            ans += 1
            while q.count > 0 {
                let w = q.removeFirst()
                if w == endWord {
                    return ans
                }
                let word = w.map { String($0) }
                for character in characters {
                    for i in 0..<word.count {
                        var word = word
                        word[i] = character
                        let w = word.joined()
                        if let i = wordMap[w], !visited[i] {
                            visited[i] = true
                            nexts.append(w)
                        }
                    }
                }
            }
            q = nexts
        }
        
        return 0
    }
}
/*
class Solution {
    var edges: [String: [String]] = [:]
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        addEdge(beginWord)
        for word in wordList {
            addEdge(word)
        }
        if edges[endWord] == nil || edges[endWord]!.isEmpty {
            return 0
        }
        var currentWords = [beginWord], wordDict:[String: Int] = [:]
        for word in edges.keys {
            wordDict[word] = 0
        }
        while true {
            if wordDict[endWord]! > 0 {
                break
            }
            var temp = [String]()
            for currentWord in currentWords {
                let nexts = edges[currentWord]!
                for next in nexts {
                    if wordDict[next] == 0 {
                        wordDict[next] = wordDict[currentWord]! + 1
                        temp.append(next)
                    }
                }
            }
            if temp.isEmpty {
                return 0
            }
            currentWords = temp
        }
        return wordDict[endWord]!/2 + 1
    }
    
    func addEdge(_ word: String) {
        edges[word] = []
        for i in 0..<word.count {
            var virtual = Array(word)
            virtual.replaceSubrange(i..<i+1, with: [Character("*")])
            let vs = String(virtual)
            edges[word]?.append(vs)
            if edges[vs] == nil {
                edges[vs] = []
            }
            edges[vs]?.append(word)
        }
    }
    
    func exceededTime(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordDict = [String: Int]()
        for word in wordList {
            wordDict[word] = 0
        }
        guard wordDict[endWord] != nil else {
            return 0
        }
        var currentWords = [beginWord], steps = 1
        while wordDict[endWord] == 0 {
            for currentWord in currentWords {
                for key in wordDict.keys {
                    if wordDict[key]! == 0 && transferable(currentWord, key) {
                        wordDict[key] = steps + 1
                    }
                }
            }
            currentWords.removeAll()
            var advanced = false
            for key in wordDict.keys {
                if wordDict[key]! == steps + 1 {
                    advanced = true
                    currentWords.append(key)
                }
            }
            if advanced {
                steps = steps + 1
            } else {
                steps = 0
                break
            }
        }
        return steps
    }
    
    func transferable(_ word1: String, _ word2: String) -> Bool {
        var diffs = 0, count = word1.count
        for i in 0..<count {
            if Array(word1)[i] != Array(word2)[i] {
                diffs += 1
                if diffs > 1 {
                    return false
                }
            }
        }
        return diffs == 1
    }
}
*/
let beginWord = "hit",
    endWord = "cog",
    wordList = ["hot","dot","dog","lot","log","cog"]
let solution = Solution()
let ans = solution.ladderLength(beginWord, endWord, wordList)
ans

//: [Next](@next)
