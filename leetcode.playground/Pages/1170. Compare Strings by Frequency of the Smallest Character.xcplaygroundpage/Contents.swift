//: [Previous](@previous)

/*
 
 1170. Compare Strings by Frequency of the Smallest Character
 
 Let's define a function f(s) over a non-empty string s, which calculates the frequency of the smallest character in s. For example, if s = "dcce" then f(s) = 2 because the smallest character is "c" and its frequency is 2.

 Now, given string arrays queries and words, return an integer array answer, where each answer[i] is the number of words such that f(queries[i]) < f(W), where W is a word in words.

  

 Example 1:

 Input: queries = ["cbd"], words = ["zaaaz"]
 Output: [1]
 Explanation: On the first query we have f("cbd") = 1, f("zaaaz") = 3 so f("cbd") < f("zaaaz").
 Example 2:

 Input: queries = ["bbb","cc"], words = ["a","aa","aaa","aaaa"]
 Output: [1,2]
 Explanation: On the first query only f("bbb") < f("aaaa"). On the second query both f("aaa") and f("aaaa") are both > f("cc").
  

 Constraints:

 1 <= queries.length <= 2000
 1 <= words.length <= 2000
 1 <= queries[i].length, words[i].length <= 10
 queries[i][j], words[i][j] are English lowercase letters.
 
 */
class Solution {
    func numSmallerByFrequency(_ queries: [String], _ words: [String]) -> [Int] {
        let queries = queries.map { f($0) }
        let words = words.map { f($0) }.sorted()
        var ans = [Int]()
        let n = words.count
        for query in queries {
            var l = 0, r = n
            while l < r {
                let mid = l + (r - l) / 2
                if words[mid] <= query {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            ans.append(n - l)
        }
        return ans
    }
    
    private func f(_ string: String) -> Int {
        var c = "z", val = 0
        let characters = Array(string).map { String($0) }
        for character in characters {
            if character == c {
                val += 1
            } else if character < c {
                c = character
                val = 1
            }
        }
        return val
    }
}

let queries = ["bbb","cc"], words = ["a","aa","aaa","aaaa"]
let solution = Solution()
let ans = solution.numSmallerByFrequency(queries, words)
ans

//: [Next](@next)
