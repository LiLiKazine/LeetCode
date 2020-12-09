//: [Previous](@previous)

/*
 
 806. Number of Lines To Write String
 
 We want to write the letters of a given string s, from left to right, into lines. Each line has a maximum width of 100 units, and if writing a letter would cause the width of the line to exceed 100 units, it is written on the next line. You are given an array widths, where widths[0] is the width of 'a', widths[1] is the width of 'b', and so on.

 Now answer two questions: how many lines have at least one character from s, and what is the last line's width? Return your answer as an integer list of length 2.

  

 Example 1:

 Input: widths = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], s = "abcdefghijklmnopqrstuvwxyz"
 Output: [3,60]
 Explanation: All letters have the same length of 10. To write all 26 letters,
 we need two full lines and one line with 60 units.
 Example 2:

 Input: widths = [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], s = "bbbcccdddaaa"
 Output: [2,4]
 Explanation: All letters except 'a' have the same length of 10, and "bbbcccdddaa" will cover 9 * 10 + 2 * 4 = 98 units.
 For the last 'a', it is written on the second line because there is only 2 units left in the first line.
 So the answer is 2 lines, plus 4 units in the second line.
  

 Constraints:

 widths.length == 26
 2 <= widths[i] <= 10
 1 <= s.length <= 1000
 s contains only lowercase English letters.
 
 */

class Solution {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
        var lev = 0, space = 0
        for c in s {
            let i = Int(c.asciiValue! - Character("a").asciiValue!)
            let width = widths[i]
            if space + width <= 100 {
                space += width
            } else {
                space = width
                lev += 1
            }
        }
        return [lev+1, space]
    }
}

//let widths = [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], s = "bbbcccdddaaa"
let widths = [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], s = "abcdefghijklmnopqrstuvwxyz"
let solution = Solution()
let ans = solution.numberOfLines(widths, s)
ans

//: [Next](@next)
