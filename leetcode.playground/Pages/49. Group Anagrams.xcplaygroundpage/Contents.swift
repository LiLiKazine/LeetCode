//: [Previous](@previous)

/*
 
 49. Group Anagrams
 
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  

 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 Example 2:

 Input: strs = [""]
 Output: [[""]]
 Example 3:

 Input: strs = ["a"]
 Output: [["a"]]
  

 Constraints:

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lower-case English letters.
 
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var catagoried: [String: [String]] = [:]
        for str in strs {
            let key = String(str.sorted())
            catagoried[key] = (catagoried[key] ?? []) + [str]
        }
        return catagoried.reduce([[String]]()) { (res, tuple) -> [[String]] in
            return res + [tuple.value]
        }
    }
}

let solution = Solution()
let ans = solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
ans

//: [Next](@next)
