//: [Previous](@previous)
 
/*
 
 140. Word Break II
 
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.

 Note:

 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 Example 1:

 Input:
 s = "catsanddog"
 wordDict = ["cat", "cats", "and", "sand", "dog"]
 Output:
 [
   "cats and dog",
   "cat sand dog"
 ]
 Example 2:

 Input:
 s = "pineapplepenapple"
 wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
 Output:
 [
   "pine apple pen apple",
   "pineapple pen apple",
   "pine applepen apple"
 ]
 Explanation: Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input:
 s = "catsandog"
 wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output:
 []
 
 */

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        guard s.count > 0 else {
            return []
        }
        var dict = [String: String]()
        for word in wordDict {
            dict[word] = word
        }
        var cache = Array<[String]>(repeating: [""], count: s.count+1)
        for i in 0..<s.count {
            var temp = [String]()
            for j in 0...i {
                let key = s[j, i]
                var pres = cache[j]
                if let word = dict[key] {
                    pres = pres.map({ (ori) -> String in
                        if ori.isEmpty {
                            return word
                        } else {
                            return ori + " " + word
                        }
                    })
                    temp.append(contentsOf: pres)
                }
            }
            cache[i+1] = temp
        }
        return cache[s.count]
    }
}

extension String {
    subscript(_ index: Int) -> String {
        get {
            return String(Array(self)[index])
        }
    }
    
    subscript(_ lower: Int, _ upper: Int) -> String {
        get {
            let temp = self[self.index(self.startIndex, offsetBy: lower)...self.index(self.startIndex, offsetBy: upper)]
            return String(temp)
        }
    }
}

let s =  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
wordDict = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]

let solution = Solution()
let ans = solution.wordBreak(s, wordDict)
ans

//: [Next](@next)
