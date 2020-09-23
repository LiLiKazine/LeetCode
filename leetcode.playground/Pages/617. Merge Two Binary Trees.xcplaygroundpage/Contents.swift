//: [Previous](@previous)

/*
 
 617. Merge Two Binary Trees
 
 Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
 
 You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
 
 Example 1:
 
 Input:
 Tree 1                     Tree 2
 1                         2
 / \                       / \
 3   2                     1   3
 /                           \   \
 5                             4   7
 Output:
 Merged tree:
 3
 / \
 4   5
 / \   \
 5   4   7
 
 
 Note: The merging process must start from the root nodes of both trees.
 
 */

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
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard t1 != nil || t2 != nil else {
            return nil
        }
        
        var root = TreeNode(0)
        next(&root, t1, t2)
        return root
    }
    
    func next(_ node: inout TreeNode, _ t1: TreeNode?, _ t2: TreeNode?) {
        node.val = (t1?.val ?? 0) + (t2?.val ?? 0)
        if t1?.left != nil || t2?.left != nil {
            var left = TreeNode(0);
            node.left = left
            next(&left, t1?.left, t2?.left)
        }
        if t1?.right != nil || t2?.right != nil {
            var right = TreeNode(0);
            node.right = right
            next(&right, t1?.right, t2?.right)
        }
        
    }
}

//: [Next](@next)
