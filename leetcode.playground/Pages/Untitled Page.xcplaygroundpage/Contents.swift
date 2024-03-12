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

//: [Next](@next)
