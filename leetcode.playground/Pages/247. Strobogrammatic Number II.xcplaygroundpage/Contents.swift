//: [Previous](@previous)

/*
 247. Strobogrammatic Number II
 中等
 Given an integer n, return all the strobogrammatic numbers that are of length n. You may return the answer in any order.

 A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).

  

 Example 1:

 Input: n = 2
 Output: ["11","69","88","96"]
 Example 2:

 Input: n = 1
 Output: ["0","1","8"]
  

 Constraints:

 1 <= n <= 14
 
 */

import Foundation

class Solution {
    
    let strobogrammatic = [
        "0" : "0",
        "1" : "1",
        "6" : "9",
        "8" : "8",
        "9" : "6"
     ]
    
    let nums = ["0", "1", "6", "8", "9"]
    
    func findStrobogrammatic(_ n: Int) -> [String] {
        if n == 1 {
            return find(n)
        }
        let ans = find(n)
            .filter { $0.first != Character("0") }
        return ans
    }
    
    func find(_ n: Int) -> [String] {
        if n == 0 { return [""] }
        if n == 1 { return ["0", "1", "8"] }
        
        var ans = [String]()
        let chunks = find(n-2)
        for num in nums {
            for chunk in chunks {
                ans.append(num + chunk + strobogrammatic[num]!)
            }
        }
        return ans
    }
}

//: [Next](@next)
