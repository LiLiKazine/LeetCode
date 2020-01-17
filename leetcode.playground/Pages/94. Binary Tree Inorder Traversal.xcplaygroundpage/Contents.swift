//: [Previous](@previous)

/*
 94. Binary Tree Inorder Traversal
 Medium

 Given a binary tree, return the inorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
    1
     \
      2
     /
    3

 Output: [1,3,2]
 Follow up: Recursive solution is trivial, could you do it iteratively?

 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        if root == nil {
//            return []
//        }
//        var res: [Int] = []
//        recursive(root!, &res)
//        return res
        let res = iterate(root)
        return res
    }
    
    func recursive(_ node: TreeNode, _ res: inout [Int]) {
        if let left = node.left {
            recursive(left, &res)
            res.append(node.val)
        } else {
            res.append(node.val)
        }
        if let right = node.right {
            recursive(right, &res)
        }
    }
    
    func iterate(_ node: TreeNode?) -> [Int] {
        var res: [Int] = []
        var root = node
        var stack: [TreeNode] = []
        while root != nil  {
            stack.append(root!)
            root = root?.left
        }
        while stack.count > 0 {
            if let last = stack.popLast() {
                res.append(last.val)
                var right = last.right
                while right != nil {
                    stack.append(right!)
                    right = right?.left
                }
            }
        }
        return res
    }
}

//: [Next](@next)
