//: [Previous](@previous)

/*
 
 227. Basic Calculator II
 
 Given a string s which represents an expression, evaluate this expression and return its value.

 The integer division should truncate toward zero.

  

 Example 1:

 Input: s = "3+2*2"
 Output: 7
 Example 2:

 Input: s = " 3/2 "
 Output: 1
 Example 3:

 Input: s = " 3+5 / 2 "
 Output: 5
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
 s represents a valid expression.
 All the integers in the expression are non-negative integers in the range [0, 231 - 1].
 The answer is guaranteed to fit in a 32-bit integer.
 
 */

class Solution {
    func calculate(_ s: String) -> Int {
        var stack: [Int] = [], s = Array(s).map { String($0) }, sign = 1, multi = 0, i = 0
        while i < s.count {
            switch s[i] {
            case "+":
                sign = 1
                multi = 0
            case "-":
                sign = -1
                multi = 0
            case "*":
                multi = 1
            case "/":
                multi = -1
            case " ":
                break
            default:
                var num = 0
                while i < s.count && Int(s[i]) != nil {
                    num *= 10
                    num += Int(s[i])!
                    i += 1
                }
                print(num)
                if multi == 0 {
                    stack.append(num * sign)
                } else if multi == -1  {
                    stack.append(stack.removeLast() / num)
                } else if multi == 1 {
                    stack.append(stack.removeLast() * num)
                }
                continue
            }
            
            i += 1
        }
        let ans = stack.reduce(0, +)
        return ans
    }
}

let s = "3+2*2"
let solution = Solution()
let ans = solution.calculate(s)
ans

//: [Next](@next)
