//: [Previous](@previous)

/*
 
 208. Implement Trie (Prefix Tree)
 
 A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

 Implement the Trie class:

 Trie() Initializes the trie object.
 void insert(String word) Inserts the string word into the trie.
 boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
 boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
  

 Example 1:

 Input
 ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
 [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
 Output
 [null, null, true, false, true, null, true]

 Explanation
 Trie trie = new Trie();
 trie.insert("apple");
 trie.search("apple");   // return True
 trie.search("app");     // return False
 trie.startsWith("app"); // return True
 trie.insert("app");
 trie.search("app");     // return True
  

 Constraints:

 1 <= word.length, prefix.length <= 2000
 word and prefix consist only of lowercase English letters.
 At most 3 * 104 calls in total will be made to insert, search, and startsWith.
 
 */

class Trie {
    
    private class Tree {
        var character: Character
        var children: [Character: Tree]
        var isEnd: Bool
        
        init(_ character: Character, _ children: [Character: Tree] = [:], _ isEnd: Bool = false) {
            self.character = character
            self.children = children
            self.isEnd = isEnd
        }
    }
    
    private let root: Tree

    /** Initialize your data structure here. */
    init() {
        root = Tree(" ")
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var curNode = root
        for c in word {
            if let node = curNode.children[c] {
                curNode = node
            } else {
                let node = Tree(c)
                curNode.children[c] = node
                curNode = node
            }
        }
        curNode.isEnd = true
        print(root)
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var curNode = root
        for c in word {
            guard let node = curNode.children[c] else {
                return false
            }
            curNode = node
        }
        return curNode.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var curNode = root
        for c in prefix {
            guard let node = curNode.children[c] else {
                return false
            }
            curNode = node
        }
        return true
    }
}

let trie = Trie();
trie.insert("apple");
trie.search("apple");   // return True
trie.search("app");     // return False
trie.startsWith("app"); // return True
trie.insert("app");
trie.search("app");     // return True

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

//: [Next](@next)
