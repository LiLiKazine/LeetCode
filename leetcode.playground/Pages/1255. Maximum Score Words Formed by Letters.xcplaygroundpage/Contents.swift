//: [Previous](@previous)

/*
 
 1255. Maximum Score Words Formed by Letters
 
 Given a list of words, list of  single letters (might be repeating) and score of every character.

 Return the maximum score of any valid set of words formed by using the given letters (words[i] cannot be used two or more times).

 It is not necessary to use all characters in letters and each letter can only be used once. Score of letters 'a', 'b', 'c', ... ,'z' is given by score[0], score[1], ... , score[25] respectively.

  

 Example 1:

 Input: words = ["dog","cat","dad","good"], letters = ["a","a","c","d","d","d","g","o","o"], score = [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]
 Output: 23
 Explanation:
 Score  a=1, c=9, d=5, g=3, o=2
 Given letters, we can form the words "dad" (5+1+5) and "good" (3+2+2+5) with a score of 23.
 Words "dad" and "dog" only get a score of 21.
 Example 2:

 Input: words = ["xxxz","ax","bx","cx"], letters = ["z","a","b","c","x","x","x"], score = [4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,10]
 Output: 27
 Explanation:
 Score  a=4, b=4, c=4, x=5, z=10
 Given letters, we can form the words "ax" (4+5), "bx" (4+5) and "cx" (4+5) with a score of 27.
 Word "xxxz" only get a score of 25.
 Example 3:

 Input: words = ["leetcode"], letters = ["l","e","t","c","o","d"], score = [0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0]
 Output: 0
 Explanation:
 Letter "e" can only be used once.
  

 Constraints:

 1 <= words.length <= 14
 1 <= words[i].length <= 15
 1 <= letters.length <= 100
 letters[i].length == 1
 score.length == 26
 0 <= score[i] <= 10
 words[i], letters[i] contains only lower case English letters.
 
 */

class Solution {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {

        
        var ans = 0, letterDict: [Character: Int] = [:]
        for letter in letters {
            letterDict[letter] = (letterDict[letter] ?? 0) + 1
        }
        let combines = itrate(words: words, letterDict: letterDict)
        
        for combine in combines {
            var s = 0

            for c in combine {
                let index = Int(c.asciiValue! - 97)
                s += score[index]
            }
            ans = max(ans, s)

        }
        
        return ans
    }
    
    func itrate(words: [String], letterDict: [Character: Int]) -> [String] {
        if words.isEmpty || letterDict.isEmpty {
            return [""]
        }
        var ans: [String] = [""]
        for i in 0..<words.count {
            
            let word = words[i]
            var dict = letterDict, flag = true
            for c in Array(word) {
                guard let count = dict[c], count > 0 else {
                    flag = false
                    break
                }
                dict[c]! -= 1
            }
            if flag {
                ans += itrate(words: Array(words[i+1..<words.count]), letterDict: dict)
                    .map { word + $0 }
            }
        }
        
        return ans
    }
}

let words = ["azb","ax","awb","ayb","bpppp"], letters = ["z","a","w","x","y","b","p","p","p"], score = [10,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,3,2,3,3]
//let words = ["leetcode"], letters = ["l","e","t","c","o","d"], score = [0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0]
//let words = ["dog","cat","dad","good"], letters = ["a","a","c","d","d","d","g","o","o"], score = [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]
//let words = ["xxxz","ax","bx","cx"], letters = ["z","a","b","c","x","x","x"], score = [4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,10]
let solution = Solution()
let ans = solution.maxScoreWords(words, letters.compactMap { Array($0).first }, score)

print(ans)

//: [Next](@next)
