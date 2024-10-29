//: [Previous](@previous)

/*
 3211. Generate Binary Strings Without Adjacent Zeros
 中等
 You are given a positive integer n.

 A binary string x is valid if all
 substrings
  of x of length 2 contain at least one "1".

 Return all valid strings with length n, in any order.

  

 Example 1:

 Input: n = 3

 Output: ["010","011","101","110","111"]

 Explanation:

 The valid strings of length 3 are: "010", "011", "101", "110", and "111".

 Example 2:

 Input: n = 1

 Output: ["0","1"]

 Explanation:

 The valid strings of length 1 are: "0" and "1".

  

 Constraints:

 1 <= n <= 18
 */

import Foundation

class Solution {
    func validStrings(_ n: Int) -> [String] {
        if n == 1 {
            return ["1", "0"]
        }
        var ans = [String]()
        for str in validStrings(n - 1) {
            if str.last == Character("1") {
                ans.append(str + "0")
            }
            ans.append(str + "1")
        }
        return ans
    }
}

//: [Next](@next)
