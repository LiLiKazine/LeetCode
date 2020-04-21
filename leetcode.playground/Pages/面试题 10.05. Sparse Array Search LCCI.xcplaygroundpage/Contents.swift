//: [Previous](@previous)

/*
 
 面试题 10.05. Sparse Array Search LCCI
 
 Given a sorted array of strings that is interspersed with empty strings, write a method to find the location of a given string.

 Example1:

  Input: words = ["at", "", "", "", "ball", "", "", "car", "", "","dad", "", ""], s = "ta"
  Output: -1
  Explanation: Return -1 if s is not in words.
 Example2:

  Input: words = ["at", "", "", "", "ball", "", "", "car", "", "","dad", "", ""], s = "ball"
  Output: 4
 Note:

 1 <= words.length <= 1000000
 
 */

import Foundation

class Solution {
    func findString(_ words: [String], _ s: String) -> Int {
//        return literate(words, s)
        return divide(words, s)
    }
    
    func divide(_ words: [String], _ s: String) -> Int {
        let count = words.count
        var h = 0, t = count-1
        while h <= t {
            while words[h].isEmpty || words[t].isEmpty {
                if words[h].isEmpty {
                    h += 1
                }
                if words[t].isEmpty {
                    t-=1
                }
            }
            var mid = (h+t)/2
            while mid < t && words[mid].isEmpty {
                mid += 1
            }
            if words[mid] > s {
                t = mid - 1
            } else if words[mid] < s {
                h = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
    
    func literate(_ words: [String], _ s: String) -> Int {
        for (i, w) in words.enumerated() {
            if w == s {
                return i
            } else if w > s {
                return -1
            }
        }
        return -1
    }
}

let words = ["at", "", "", "", "ball", "", "", "car", "", "", "dad", "", ""]
let s = "ball"
let solution = Solution()
let ans = solution.divide(words, s)

//: [Next](@next)
