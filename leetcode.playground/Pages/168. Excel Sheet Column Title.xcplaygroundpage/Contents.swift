//: [Previous](@previous)

/*
 
 168. Excel Sheet Column Title
 
 Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

 For example:

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
  

 Example 1:

 Input: columnNumber = 1
 Output: "A"
 Example 2:

 Input: columnNumber = 28
 Output: "AB"
 Example 3:

 Input: columnNumber = 701
 Output: "ZY"
 Example 4:

 Input: columnNumber = 2147483647
 Output: "FXSHRXW"
  

 Constraints:

 1 <= columnNumber <= 231 - 1
 
 */

/*
 
 class Solution {
     public String convertToTitle(int cn) {
         StringBuilder sb = new StringBuilder();
         while (cn > 0) {
             cn--;
             sb.append((char)(cn % 26 + 'A'));
             cn /= 26;
         }
         sb.reverse();
         return sb.toString();
     }
 }
 
 */

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var n = columnNumber, ans = ""
        while n > 0 {
            n -= 1
            let ascii = Int(Character("A").asciiValue!) + (n % 26)
            let c = Character(UnicodeScalar(ascii)!)
            ans.insert(c, at: ans.startIndex)
            n /= 26
        }
        return ans
    }
}

let columnNumber = 2147483647
let solution = Solution()
let ans = solution.convertToTitle(columnNumber)
ans

//: [Next](@next)
