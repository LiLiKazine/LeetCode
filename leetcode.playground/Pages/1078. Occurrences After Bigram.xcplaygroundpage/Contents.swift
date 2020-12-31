//: [Previous](@previous)

/*
 
 1078. Occurrences After Bigram
 
 Given words first and second, consider occurrences in some text of the form "first second third", where second comes immediately after first, and third comes immediately after second.

 For each such occurrence, add "third" to the answer, and return the answer.

  

 Example 1:

 Input: text = "alice is a good girl she is a good student", first = "a", second = "good"
 Output: ["girl","student"]
 Example 2:

 Input: text = "we will we will rock you", first = "we", second = "will"
 Output: ["we","rock"]
  

 Note:

 1 <= text.length <= 1000
 text consists of space separated words, where each word consists of lowercase English letters.
 1 <= first.length, second.length <= 10
 first and second consist of lowercase English letters.
 
 */

class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        var components = text.split(separator: " ").map { String($0) },
            ans: [String] = []
        while components.count > 2 {
            if first == components[0] &&
                second == components[1] {
                ans.append(components[2])
            }
            components.removeFirst()
        }
        
        return ans
    }
}

let text = "we will we will rock you", first = "we", second = "will"
let solution = Solution()
let ans = solution.findOcurrences(text, first, second)
ans

//: [Next](@next)
