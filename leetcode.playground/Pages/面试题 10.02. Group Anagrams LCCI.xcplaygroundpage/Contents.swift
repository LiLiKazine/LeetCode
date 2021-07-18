//: [Previous](@previous)

/*
 
 面试题 10.02. Group Anagrams LCCI
 
 Write a method to sort an array of strings so that all the anagrams are in the same group.

 Note: This problem is slightly different from the original one the book.

 Example:

 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 Notes:

 All inputs will be in lowercase.
 The order of your output does not matter.
 
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var dict: [String: [String]] = [:]
        for str in strs {
            let key = String(str.sorted())
            dict[key] = (dict[key] ?? []) + [str]
        }
        let ans = Array(dict.values)
        return ans
    }
}

let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
let solution = Solution()
let ans = solution.groupAnagrams(strs)
ans

//: [Next](@next)
