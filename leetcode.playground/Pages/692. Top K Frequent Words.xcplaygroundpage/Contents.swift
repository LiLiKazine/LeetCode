//: [Previous](@previous)

/*
 
 692. Top K Frequent Words
 
 Given a non-empty list of words, return the k most frequent elements.

 Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

 Example 1:
 Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
 Output: ["i", "love"]
 Explanation: "i" and "love" are the two most frequent words.
     Note that "i" comes before "love" due to a lower alphabetical order.
 Example 2:
 Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
 Output: ["the", "is", "sunny", "day"]
 Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
     with the number of occurrence being 4, 3, 2 and 1 respectively.
 Note:
 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Input words contain only lowercase letters.
 Follow up:
 Try to solve it in O(n log k) time and O(n) extra space.
 
 */

class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        
        var dict: [String: Int] = [:]
        for word in words {
            dict[word] = (dict[word] ?? 0) + 1
        }
        let pairs = dict.sorted { (pair1, pair2) -> Bool in
            if pair1.value == pair2.value {
                return pair1.key <= pair2.key
            }
            return pair1.value >= pair2.value
        }
        return pairs[0..<k].map { $0.key }
    }
}

let words = ["i", "love", "leetcode", "i", "love", "coding"], k = 2
//let words = ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
let solution = Solution()
let ans = solution.topKFrequent(words, k)
ans

//: [Next](@next)
