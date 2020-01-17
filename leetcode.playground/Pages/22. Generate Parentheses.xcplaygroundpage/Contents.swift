//: [Previous](@previous)

/*
 22. Generate Parentheses
 Medium

 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]
 
 */

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        return recursive(n, "(", 1, 0)
    }
    
    func recursive(_ n: Int, _ head: String, _ l: Int, _ r: Int) -> [String] {
        if head.count == n * 2 {
            return [head]
        }
        var res: [String] = []
        if l - r == 0 {
            let tail = recursive(n, head + "(", l+1, r)
            res.append(contentsOf: tail)
        } else {
            if l < n {
                let t1 = recursive(n, head + "(", l+1, r)
                res.append(contentsOf: t1)
            }
            let t2 = recursive(n, head + ")", l, r+1)
            res.append(contentsOf: t2)
        }
        return res
    }
}

let test = Solution()
let result = test.generateParenthesis(3)
//: [Next](@next)
