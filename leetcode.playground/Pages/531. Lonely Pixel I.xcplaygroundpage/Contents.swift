//: [Previous](@previous)

/*
 531. Lonely Pixel I
 
 Given an m x n picture consisting of black 'B' and white 'W' pixels, return the number of black lonely pixels.

 A black lonely pixel is a character 'B' that located at a specific position where the same row and same column don't have any other black pixels.

  

 Example 1:


 Input: picture = [["W","W","B"],["W","B","W"],["B","W","W"]]
 Output: 3
 Explanation: All the three 'B's are black lonely pixels.
 Example 2:


 Input: picture = [["B","B","B"],["B","B","W"],["B","B","B"]]
 Output: 0
  

 Constraints:

 m == picture.length
 n == picture[i].length
 1 <= m, n <= 500
 picture[i][j] is 'W' or 'B'.
 
 */

import Foundation

class Solution {
    func findLonelyPixel(_ picture: [[Character]]) -> Int {
        
        var r = Array(repeating: 0, count: picture.count)
        var c = Array(repeating: 0, count: picture[0].count)
        
        for i in 0..<picture.count {
            for j in 0..<picture[i].count {
                if picture[i][j] == Character("B") {
                    r[i] += 1
                    c[j] += 1
                }
            }
        }
        var ans = 0
        for i in 0..<picture.count {
            for j in 0..<picture[i].count {
                if picture[i][j] == Character("B") && r[i] == 1 && c[j] == 1 {
                   ans += 1
                }
            }
        }
        return ans
    }
}

//: [Next](@next)
