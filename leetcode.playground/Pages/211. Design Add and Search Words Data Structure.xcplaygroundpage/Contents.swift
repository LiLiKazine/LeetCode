//: [Previous](@previous)

/*
 211. Design Add and Search Words Data Structure
 中等
 Design a data structure that supports adding new words and finding if a string matches any previously added string.

 Implement the WordDictionary class:

 WordDictionary() Initializes the object.
 void addWord(word) Adds word to the data structure, it can be matched later.
 bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
  

 Example:

 Input
 ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
 [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
 Output
 [null,null,null,null,false,true,true,true]

 Explanation
 WordDictionary wordDictionary = new WordDictionary();
 wordDictionary.addWord("bad");
 wordDictionary.addWord("dad");
 wordDictionary.addWord("mad");
 wordDictionary.search("pad"); // return False
 wordDictionary.search("bad"); // return True
 wordDictionary.search(".ad"); // return True
 wordDictionary.search("b.."); // return True
  

 Constraints:

 1 <= word.length <= 25
 word in addWord consists of lowercase English letters.
 word in search consist of '.' or lowercase English letters.
 There will be at most 2 dots in word for search queries.
 At most 104 calls will be made to addWord and search.
 
 */

import Foundation


private class Node {
    
    let char: Character
    var isWord: Bool
    var children: [Character: Node]
    
    init(char: Character, isWord: Bool = false, children: [Character : Node] = [:]) {
        self.char = char
        self.isWord = isWord
        self.children = children
    }
}

class WordDictionary {
    
    private let root = Node(char: Character(Unicode.Scalar(0)))

    init() {

    }
    
    func addWord(_ word: String) {
        var cur = root
        for char in word {
            if let node = cur.children[char] {
                cur = node
            } else {
                let node = Node(char: char)
                cur.children[char] = node
                cur = node
            }
        }
        cur.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        let chars = Array(word)
        return search(chars, i: 0, node: root)
    }
    
    private func search(_ chars: [Character], i: Int, node: Node) -> Bool {
        if i == chars.count {
            return node.isWord
        }
        let char = chars[i]
        if char == Character(".") {
            for next in node.children.values {
                let find = search(chars, i: i + 1, node: next)
                if find {
                    return true
                }
            }
            return false
        }
        if let next = node.children[char] {
            return search(chars, i: i + 1, node: next)
        }
        return false
        
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */

//: [Next](@next)
