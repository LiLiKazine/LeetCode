//: [Previous](@previous)

/*
 536. Construct Binary Tree from String
 中等
 You need to construct a binary tree from a string consisting of parenthesis and integers.

 The whole input represents a binary tree. It contains an integer followed by zero, one or two pairs of parenthesis. The integer represents the root's value and a pair of parenthesis contains a child binary tree with the same structure.

 You always start to construct the left child node of the parent first if it exists.

  

 Example 1:


 Input: s = "4(2(3)(1))(6(5))"
 Output: [4,2,6,3,1,5]
 Example 2:

 Input: s = "4(2(3)(1))(6(5)(7))"
 Output: [4,2,6,3,1,5,7]
 Example 3:

 Input: s = "-4(2(3)(1))(6(5)(7))"
 Output: [-4,2,6,3,1,5,7]
  

 Constraints:

 0 <= s.length <= 3 * 104
 s consists of digits, '(', ')', and '-' only.
 */

import Foundation

class Solution {
    func str2tree(_ s: String) -> TreeNode? {
        let s = s.map { String($0) }
        
        
        func buildTree(_ range: Range<Int>) -> TreeNode? {
            if s.isEmpty { return nil }
            var num = "", i = range.lowerBound
            while i < range.upperBound && s[i] != "(" && s[i] != ")" {
                num += s[i]
                i += 1
            }
            if num.isEmpty { return nil }
            let root = TreeNode(Int(num)!)
            var stk = [String]()
            var pivot = range.upperBound

            for k in i..<range.upperBound {
                if s[k] == ")" {
                    while stk.last != "(" {
                        stk.removeLast()
                    }
                    stk.removeLast()
                    if stk.isEmpty {
                        pivot = k
                        break
                    }
                } else {
                    stk.append(s[k])
                }
            }
            if i + 1 < pivot {
                root.left = buildTree((i+1)..<pivot)
            }
            if pivot + 2 < range.upperBound - 1 {
                root.right = buildTree((pivot+2)..<(range.upperBound-1))
            }
            return root
        }
        
        return buildTree(0..<s.count)
    }
}

//: [Next](@next)
