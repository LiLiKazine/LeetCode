//: [Previous](@previous)

/*
 
 1234. Replace the Substring for Balanced String
 
 You are given a string containing only 4 kinds of characters 'Q', 'W', 'E' and 'R'.

 A string is said to be balanced if each of its characters appears n/4 times where n is the length of the string.

 Return the minimum length of the substring that can be replaced with any other string of the same length to make the original string s balanced.

 Return 0 if the string is already balanced.

  

 Example 1:

 Input: s = "QWER"
 Output: 0
 Explanation: s is already balanced.
 Example 2:

 Input: s = "QQWE"
 Output: 1
 Explanation: We need to replace a 'Q' to 'R', so that "RQWE" (or "QRWE") is balanced.
 Example 3:

 Input: s = "QQQW"
 Output: 2
 Explanation: We can replace the first "QQ" to "ER".
 Example 4:

 Input: s = "QQQQ"
 Output: 3
 Explanation: We can replace the last 3 'Q' to make s = "QWER".
  

 Constraints:

 1 <= s.length <= 10^5
 s.length is a multiple of 4
 s contains only 'Q', 'W', 'E' and 'R'.
 
 
 */

import Foundation

class Solution {
    func balancedString(_ s: String) -> Int {
        
        let s = Array(s).map { String($0) }
        let count = s.count / 4
        
        var dict: [String: Int] = [
            "Q": 0,
            "W": 0,
            "E": 0,
            "R": 0
        ]
        
        for c in s {
            dict[c]! += 1
        }
        
        if !dict.values.contains(where: { $0 != count }) {
            return 0
        }
        
        var l = 0, r = 0
        
        var ans = Int.max
        
        while l <= r && r < s.count {
            dict[s[r]]! -= 1
            if dict.values.contains(where: { $0 > count }) {
                r += 1
            } else {
                ans = min(ans, r - l + 1)
                dict[s[l]]! += 1
                dict[s[r]]! += 1
                l += 1
            }
        }
        return ans
    }
    
}

//let s = "QWER"
//let s = "QQWE"
//let s = "QQQW"
let s = "WWQQRRRRQRQQ"
let solution = Solution()
let ans = solution.balancedString(s)
print(ans)


/*
 
 func balancedString(_ s: String) -> Int {
     let target = s.count / 4
     var arr: [Character: Int] = [:], element: [Character: Int] = [:]
     for c in s {
         if arr[c] == nil {
             arr[c] = 1
         }  else {
             arr[c]! += 1
         }
     }
     for key in arr.keys {
         let num = arr[key]! - target
         if num > 0 {
             element[key] = num
         }
     }
     if element.isEmpty {
         return 0
     }
     let s = Array<Character>(s)

     var l = 0, r = 0, count = s.count
     while l <= r, r < s.count {

         if element[s[r]] != nil {
             element[s[r]]! -= 1
         }
         let res = element.values.reduce(0) { (res, val) -> Int in
             res + max(val, 0)
         }
         if res == 0 {
             count = min(count, r - l + 1)
             if element[s[l]] != nil {
                 element[s[l]]! += 1
             }
             if element[s[r]] != nil {
                 element[s[r]]! += 1
             }
             l += 1
         } else {
             r += 1
         }
     }
     return count
 }
 
 */

/*
 
 func contain(_ parent: [Character], _ child: [Character]) -> Bool {
        var child = child, parent = parent
        while !child.isEmpty {
            if let index = parent.firstIndex(of: child.removeFirst()) {
                parent.remove(at: index)
            } else {
                return false
            }
        }
        return true
    }
    
    func exceeded(_ s: String) -> Int {
        let target = s.count / 4
        var arr: [Character: Int] = [:], element: [Character] = []
        for c in s {
            if arr[c] == nil {
                arr[c] = 1
            }  else {
                arr[c]! += 1
            }
        }
        for key in arr.keys {
            let num = arr[key]! - target
            if num > 0 {
                element.append(contentsOf: Array(repeating: key, count: num))
            }
        }
        if element.isEmpty {
            return 0
        }
        var count = Int.max
        let characters = Array<Character>(s)
        print(characters.count, element)
        for i in 0...characters.count-element.count {
            if element.contains(characters[i]) {
                count = min(count, subString(characters, begin: i, element: element, count: count))
            }
        }
        return count
    }
    
    func subString(_ characters: [Character], begin: Int, element: [Character], count: Int) -> Int {
        var element = element, i = begin
        while i < characters.count && !element.isEmpty {
            if let index = element.firstIndex(of: characters[i]) {
                element.remove(at: index)
            }
            i += 1
            if i-begin >= count {
                return Int.max
            }
        }
        if element.isEmpty {
            return i-begin
        } else {
            return Int.max
        }
    }
 
 */

//: [Next](@next)
