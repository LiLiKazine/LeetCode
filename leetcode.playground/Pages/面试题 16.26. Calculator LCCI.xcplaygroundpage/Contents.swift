//: [Previous](@previous)

/*
 
 面试题 16.26. Calculator LCCI
 
 Given an arithmetic equation consisting of positive integers, +, -, * and / (no paren­theses), compute the result.

 The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.

 Example 1:

 Input: "3+2*2"
 Output: 7
 Example 2:

 Input: " 3/2 "
 Output: 1
 Example 3:

 Input: " 3+5 / 2 "
 Output: 5
 Note:

 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 
 */
//1+1+1
class Solution {
    func calculate(_ s: String) -> Int {
        var s = Array(s), stack = [Int](), i = 0, j = 0
        while i < s.count {
            let c = s[i]
            if c.isWhitespace {
                s.remove(at: i)
                continue
            }
            i += 1
        }
        i = 0
        while i < s.count {
            let c1 = s[i]
            if isOP(c1) || i == 0 {
                let head = i == 0 ? i : i + 1
                j = head + 1
                var val = 0
                while j < s.count {
                    let c = s[j]
                    if isOP(c) {
                        val = Int(String(s[head..<j]))!
                        break
                    } else {
                        j += 1
                    }
                }
                if j == s.count {
                    val = Int(String(s[head..<j]))!
                }
                if i == 0 {
                    stack.append(val)
                }
                i = j
                switch c1 {
                case Character("+"):
                    stack.append(val)
                case Character("-"):
                    stack.append(-val)
                case Character("*"):
                    let res = stack.removeLast() * val
                    stack.append(res)
                case Character("/"):
                    let res = stack.removeLast() / val
                    stack.append(res)
                default:
                    break
                }
            } else {
                i += 1
            }
        }
        return stack.reduce(0, +)
    }
    
    func isOP(_ c: Character) -> Bool {
        switch c {
        case Character("+"), Character("-"), Character("*"), Character("/"):
            return true
        default:
            return false
        }
    }
}

let solution = Solution()
let ans = solution.calculate(" 3+5 / 2 ")
ans

//: [Next](@next)
