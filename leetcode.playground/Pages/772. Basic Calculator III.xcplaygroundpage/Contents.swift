//: [Previous](@previous)

/*
 772. Basic Calculator III
 
 Implement a basic calculator to evaluate a simple expression string.

 The expression string contains only non-negative integers, '+', '-', '*', '/' operators, and open '(' and closing parentheses ')'. The integer division should truncate toward zero.

 You may assume that the given expression is always valid. All intermediate results will be in the range of [-231, 231 - 1].

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

  

 Example 1:

 Input: s = "1+1"
 Output: 2
 Example 2:

 Input: s = "6-4/2"
 Output: 4
 Example 3:

 Input: s = "2*(5+5*2)/3+(6/2+8)"
 Output: 21
  

 Constraints:

 1 <= s <= 104
 s consists of digits, '+', '-', '*', '/', '(', and ')'.
 s is a valid expression.
 
 */

import Foundation

class Solution {
    func calculate(_ s: String) -> Int {
        let s: [String] = Array(s).compactMap { c in
            let s = String(c)
            if s == " " { return nil }
            return s
        }
        var stack = [String]()
        for c in s {
            if c == ")" {
                var exp = [String]()
                while !stack.isEmpty && stack.last != "(" {
                    exp.append(stack.removeLast())
                }
                stack.removeLast()
                let val = base(exp.reversed())
                stack.append(String(val))
            } else {
                if let last = stack.last, Int(last) != nil && Int(c) != nil {
                    let val = stack.removeLast()
                    stack.append(val + c)
                } else {
                    stack.append(c)
                }
            }
        }
        let val = base(stack)
        return val
    }
   
    func base(_ s: [String]) -> Int {
        var num = 0, sign = "+"
        var stk = [Int]()
        for i in 0..<s.count {
            let c = s[i]
            if let val = Int(c) {
                num = val
                if i != s.count - 1 { continue }
            }
            
            switch sign {
            case "+":
                stk.append(num)
            case "-":
                stk.append(-num)
            case "*":
                let val = stk.removeLast() * num
                stk.append(val)
            case "/":
                let val = stk.removeLast() / num
                stk.append(val)
            default: break
            }
            sign = c
        }
        return stk.reduce(0, +)
    }
}

//: [Next](@next)
