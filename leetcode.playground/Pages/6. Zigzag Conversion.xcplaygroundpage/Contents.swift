//: [Previous](@previous)

/*
 6. Zigzag Conversion
 中等
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  

 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 Example 3:

 Input: s = "A", numRows = 1
 Output: "A"
  

 Constraints:

 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000
 
 */

import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 { return s }
        var rows = Array(repeating: [Character](), count: numRows)
        var i = 0, row = 0, flag = true
        
        while i < s.count {
            let c = s[s.index(s.startIndex, offsetBy: i)]
            rows[row].append(c)
            if row == numRows - 1 {
                flag = false
                row -= 1
            } else if row == 0 {
                flag = true
                row += 1
            } else {
                row = row + (flag ? 1 : -1)
            }
            i += 1
        }
        var ans = ""
        for arr in rows {
            ans.append(String(arr))
        }
        return ans
    }
}

//: [Next](@next)
